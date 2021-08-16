const web3 = require('web3');
//const globweb3 = new Web3(web3.givenProvider || "http://localhost:8545");
const truffleAssert = require('truffle-assertions');
const BN = web3.utils.BN;
const chaiBN = require('chai-bn')(BN);

require('chai').use(chaiBN);

// Installing chai-bn for the user is part of the offering.
//
// The chai module used internally by us may not be the same one that the user
// has in their own tests. This can happen if the version ranges required don't
// intersect, or if the package manager doesn't dedupe the modules for any
// other reason. We do our best to install chai-bn for the user.
for (const mod of [require.main, module.parent]) {
  try {
    mod.require('chai').use(chaiBN);
  } catch (e) {
    // Ignore errors
  }
} 

const ZERO_ADDRESS = '0x0000000000000000000000000000000000000000';
 
const { expect } = require('chai');

/*
const {expectEvent, expectRevert} = module.exports = { 
  get expectEvent () { return require('./expectEvent'); }, 
  get expectRevert () { return require('./expectRevert'); }, 
};*/


//const { expectEvent } = require('./expectEvent'); 
//const { expectRevert } = require('./expectRevert'); 


//const { expectEvent } = module.exports.expectEvent; 
//const { expectRevert } = module.exports.expectRevert; 
 
const {
  shouldBehaveLikeERC20,
  shouldBehaveLikeERC20Transfer,
  shouldBehaveLikeERC20Approve,
} = require('./ERC20.behavior');

const TZTokens = artifacts.require('TZTokens');
//const ERC20DecimalsMock = artifacts.require('ERC20DecimalsMock');

contract('ERC20', function (accounts) {
  const [ initialHolder, recipient, anotherAccount ] = accounts;

  const name = 'TZTokens';
  const symbol = 'TZT';

  const initialSupply = new BN(1000000000);

  beforeEach(async function () {
    //this.token = await TZTokens.new(name, symbol, initialHolder, initialSupply);
    this.token = await TZTokens.new();
  });

  it('has a name', async function () {
    expect(await this.token.name()).to.equal(name);
  });

  it('has a symbol', async function () {
    expect(await this.token.symbol()).to.equal(symbol);
  });

  it('has 6 decimals', async function () {
    expect(await this.token.decimals()).to.be.bignumber.equal('6');
  });
 

  shouldBehaveLikeERC20('ERC20', initialSupply, initialHolder, recipient, anotherAccount);

  describe('decrease allowance', function () {
    describe('when the spender is not the zero address', function () {
      const spender = recipient;

      function shouldDecreaseApproval (amount) {
        describe('when there was no approved amount before', function () {
          it('reverts', async function () {
            await truffleAssert.reverts(this.token.decreaseAllowance(
              spender, amount, { from: initialHolder }), 'ERC20: decreased allowance below zero',
            );
            /*await expectRevert(this.token.decreaseAllowance(
              spender, amount, { from: initialHolder }), 'ERC20: decreased allowance below zero',
            );*/
          });
        });

        describe('when the spender had an approved amount', function () {
          const approvedAmount = amount;

          beforeEach(async function () {
            ({ logs: this.logs } = await this.token.approve(spender, approvedAmount, { from: initialHolder }));
          });

          it('emits an approval event', async function () {
            //const { logs } = await this.token.decreaseAllowance(spender, approvedAmount, { from: initialHolder });
            const  logs  = await this.token.decreaseAllowance(spender, approvedAmount, { from: initialHolder });

            truffleAssert.eventEmitted(logs, 'Approval', {
              owner: initialHolder,
              spender: spender,
              value: new BN(0),
            });  
            /*expectEvent.inLogs(logs, 'Approval', {
              owner: initialHolder,
              spender: spender,
              value: new BN(0),
            });*/
          });

          it('decreases the spender allowance subtracting the requested amount', async function () {
            await this.token.decreaseAllowance(spender, approvedAmount.subn(1), { from: initialHolder });

            expect(await this.token.allowance(initialHolder, spender)).to.be.bignumber.equal('1');
          });

          it('sets the allowance to zero when all allowance is removed', async function () {
            await this.token.decreaseAllowance(spender, approvedAmount, { from: initialHolder });
            expect(await this.token.allowance(initialHolder, spender)).to.be.bignumber.equal('0');
          });

          it('reverts when more than the full allowance is removed', async function () {
            await truffleAssert.reverts(
              this.token.decreaseAllowance(spender, approvedAmount.addn(1), { from: initialHolder }),
              'ERC20: decreased allowance below zero',
            );
            /*await expectRevert(
              this.token.decreaseAllowance(spender, approvedAmount.addn(1), { from: initialHolder }),
              'ERC20: decreased allowance below zero',
            );*/
          });
        });
      }

      describe('when the sender has enough balance', function () {
        const amount = initialSupply;

        shouldDecreaseApproval(amount);
      });

      describe('when the sender does not have enough balance', function () {
        const amount = initialSupply.addn(1);

        shouldDecreaseApproval(amount);
      });
    });

    describe('when the spender is the zero address', function () {
      const amount = initialSupply;
      const spender = ZERO_ADDRESS;

      it('reverts', async function () {
        await truffleAssert.reverts(this.token.decreaseAllowance(
          spender, amount, { from: initialHolder }), 'ERC20: decreased allowance below zero',
        );
        /*await expectRevert(this.token.decreaseAllowance(
          spender, amount, { from: initialHolder }), 'ERC20: decreased allowance below zero',
        );*/
      });
    });
  });

  describe('increase allowance', function () {
    const amount = initialSupply;

    describe('when the spender is not the zero address', function () {
      const spender = recipient;

      describe('when the sender has enough balance', function () {
        it('emits an approval event', async function () {
          //const { logs } = await this.token.increaseAllowance(spender, amount, { from: initialHolder });
          const  logs  = await this.token.increaseAllowance(spender, amount, { from: initialHolder });

          truffleAssert.eventEmitted(logs, 'Approval', {
            owner: initialHolder,
            spender: spender,
            value: amount,
          });  
          /*expectEvent.inLogs(logs, 'Approval', {
            owner: initialHolder,
            spender: spender,
            value: amount,
          });*/
        });

        describe('when there was no approved amount before', function () {
          it('approves the requested amount', async function () {
            await this.token.increaseAllowance(spender, amount, { from: initialHolder });

            expect(await this.token.allowance(initialHolder, spender)).to.be.bignumber.equal(amount);
          });
        });

        describe('when the spender had an approved amount', function () {
          beforeEach(async function () {
            await this.token.approve(spender, new BN(1), { from: initialHolder });
          });

          it('increases the spender allowance adding the requested amount', async function () {
            await this.token.increaseAllowance(spender, amount, { from: initialHolder });

            expect(await this.token.allowance(initialHolder, spender)).to.be.bignumber.equal(amount.addn(1));
          });
        });
      });

      describe('when the sender does not have enough balance', function () {
        const amount = initialSupply.addn(1);

        it('emits an approval event', async function () {
          //const { logs } = await this.token.increaseAllowance(spender, amount, { from: initialHolder });
          const  logs  = await this.token.increaseAllowance(spender, amount, { from: initialHolder });

          truffleAssert.eventEmitted(logs, 'Approval', {
            owner: initialHolder,
            spender: spender,
            value: amount,
          });  
          /*expectEvent.inLogs(logs, 'Approval', {
            owner: initialHolder,
            spender: spender,
            value: amount,
          });*/
        });

        describe('when there was no approved amount before', function () {
          it('approves the requested amount', async function () {
            await this.token.increaseAllowance(spender, amount, { from: initialHolder });

            expect(await this.token.allowance(initialHolder, spender)).to.be.bignumber.equal(amount);
          });
        });

        describe('when the spender had an approved amount', function () {
          beforeEach(async function () {
            await this.token.approve(spender, new BN(1), { from: initialHolder });
          });

          it('increases the spender allowance adding the requested amount', async function () {
            await this.token.increaseAllowance(spender, amount, { from: initialHolder });

            expect(await this.token.allowance(initialHolder, spender)).to.be.bignumber.equal(amount.addn(1));
          });
        });
      });
    });

    describe('when the spender is the zero address', function () {
      const spender = ZERO_ADDRESS;

      it('reverts', async function () {
        await truffleAssert.reverts(
          this.token.increaseAllowance(spender, amount, { from: initialHolder }), 'ERC20: approve to the zero address',
        );
        /*await expectRevert(
          this.token.increaseAllowance(spender, amount, { from: initialHolder }), 'ERC20: approve to the zero address',
        );*/
      });
    });
  });

  describe('_mint', function () {
    const amount = new BN(50);
    it('rejects a null account', async function () {
      await truffleAssert.reverts(
        this.token.mint(ZERO_ADDRESS, amount), 'ERC20: mint to the zero address',
      );
      /*await expectRevert(
        this.token.mint(ZERO_ADDRESS, amount), 'ERC20: mint to the zero address',
      );*/
    });

    describe('for a non zero account', function () {
      beforeEach('minting', async function () {
        //const { logs } = await this.token.mint(recipient, amount);
        const  logs  = await this.token.mint(recipient, amount);
        this.logs = logs;
      });

      it('increments totalSupply', async function () {
        const expectedSupply = initialSupply.add(amount);
        expect(await this.token.totalSupply()).to.be.bignumber.equal(expectedSupply);
      });

      it('increments recipient balance', async function () {
        expect(await this.token.balanceOf(recipient)).to.be.bignumber.equal(amount);
      });

      it('emits Transfer event', async function () {
        const event = truffleAssert.eventEmitted(this.logs, 'Transfer', {
          from: ZERO_ADDRESS,
          to: recipient,
        });  /*expectEvent.inLogs(this.logs, 'Transfer', {
          from: ZERO_ADDRESS,
          to: recipient,
        });*/

        expect(event.args.value).to.be.bignumber.equal(amount);
      });
    });
  });

  describe('_burn', function () {
    it('rejects a null account', async function () {
      await truffleAssert.reverts(this.token.burn(ZERO_ADDRESS, new BN(1)),
      'ERC20: burn from the zero address');
      /* await expectRevert(this.token.burn(ZERO_ADDRESS, new BN(1)),
        'ERC20: burn from the zero address');*/
    });

    describe('for a non zero account', function () {
      it('rejects burning more than balance', async function () {
        await truffleAssert.reverts(this.token.burn(
          initialHolder, initialSupply.addn(1)), 'ERC20: burn amount exceeds balance',
        );
        /*await expectRevert(this.token.burn(
          initialHolder, initialSupply.addn(1)), 'ERC20: burn amount exceeds balance',
        );*/
      });

      const describeBurn = function (description, amount) {
        describe(description, function () {
          beforeEach('burning', async function () {
            //const { logs } = await this.token.burn(initialHolder, amount);
            const  logs  = await this.token.burn(initialHolder, amount);
            this.logs = logs;
          });

          it('decrements totalSupply', async function () {
            const expectedSupply = initialSupply.sub(amount);
            expect(await this.token.totalSupply()).to.be.bignumber.equal(expectedSupply);
          });

          it('decrements initialHolder balance', async function () {
            const expectedBalance = initialSupply.sub(amount);
            expect(await this.token.balanceOf(initialHolder)).to.be.bignumber.equal(expectedBalance);
          });

          it('emits Transfer event', async function () {
            const event = truffleAssert.eventEmitted(this.logs, 'Transfer', {
              from: initialHolder,
              to: ZERO_ADDRESS,
            });/*expectEvent.inLogs(this.logs, 'Transfer', {
              from: initialHolder,
              to: ZERO_ADDRESS,
            });*/

            expect(event.args.value).to.be.bignumber.equal(amount);
          });
        });
      };

      describeBurn('for entire balance', initialSupply);
      describeBurn('for less amount than balance', initialSupply.subn(1));
    });
  });

  describe('_transfer', function () {
    shouldBehaveLikeERC20Transfer('ERC20', initialHolder, recipient, initialSupply, function (from, to, amount) {
      return this.token.transferInternal(from, to, amount);
    });

    describe('when the sender is the zero address', function () {
      it('reverts', async function () {
        await truffleAssert.reverts(this.token.transferInternal(ZERO_ADDRESS, recipient, initialSupply),
        'ERC20: transfer from the zero address',
      );
        /*await expectRevert(this.token.transferInternal(ZERO_ADDRESS, recipient, initialSupply),
          'ERC20: transfer from the zero address',
        );*/
      });
    });
  });

  describe('_approve', function () {
    shouldBehaveLikeERC20Approve('ERC20', initialHolder, recipient, initialSupply, function (owner, spender, amount) {
      return this.token.approveInternal(owner, spender, amount);
    });

    describe('when the owner is the zero address', function () {
      it('reverts', async function () {
        await truffleAssert.reverts(this.token.approveInternal(ZERO_ADDRESS, recipient, initialSupply),
        'ERC20: approve from the zero address',
      );
        /*await expectRevert(this.token.approveInternal(ZERO_ADDRESS, recipient, initialSupply),
          'ERC20: approve from the zero address',
        );*/
      });
    });
  });
});
