const web3 = require('web3');
//const web3 = new Web3(Web3.givenProvider || "http://localhost:8545");
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
for (const mod of [require.main, module.children]) {
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

 

function shouldBehaveLikeERC20 (errorPrefix, initialSupply, initialHolder, recipient, anotherAccount) {
  describe('total supply', function () {
    it('returns the total amount of tokens', async function () {
      expect(await this.token.totalSupply()).to.be.bignumber.equal(initialSupply);
    });
  });

  describe('balanceOf', function () {
    describe('when the requested account has no tokens', function () {
      it('returns zero', async function () {
        expect(await this.token.balanceOf(anotherAccount)).to.be.bignumber.equal('0');
      });
    });

    describe('when the requested account has some tokens', function () {
      it('returns the total amount of tokens', async function () {
        expect(await this.token.balanceOf(initialHolder)).to.be.bignumber.equal(initialSupply);
      });
    });
  });

  describe('transfer', function () {
    shouldBehaveLikeERC20Transfer(errorPrefix, initialHolder, recipient, initialSupply,
      function (from, to, value) {
        return this.token.transfer(to, value, { from });
      },
    );
  });

  describe('transfer from', function () {
    const spender = recipient;

    describe('when the token owner is not the zero address', function () {
      const tokenOwner = initialHolder;

      describe('when the recipient is not the zero address', function () {
        const to = anotherAccount;

        describe('when the spender has enough approved balance', function () {
          beforeEach(async function () {
            await this.token.approve(spender, initialSupply, { from: initialHolder });
          });

          describe('when the token owner has enough balance', function () {
            const amount = initialSupply;

            it('transfers the requested amount', async function () {
              await this.token.transferFrom(tokenOwner, to, amount, { from: spender });

              expect(await this.token.balanceOf(tokenOwner)).to.be.bignumber.equal('0');

              expect(await this.token.balanceOf(to)).to.be.bignumber.equal(amount);
            });

            it('decreases the spender allowance', async function () {
              await this.token.transferFrom(tokenOwner, to, amount, { from: spender });

              expect(await this.token.allowance(tokenOwner, spender)).to.be.bignumber.equal('0');
            });

            it('emits a transfer event', async function () {
              //const { logs } = await this.token.transferFrom(tokenOwner, to, amount, { from: spender });
              const  logs  = await this.token.transferFrom(tokenOwner, to, amount, { from: spender });

              truffleAssert.eventEmitted(logs, 'Transfer', (ev) => {
                expect (ev.from).to.equal(tokenOwner);
                expect (ev.to).to.equal(to);
                expect (ev.value).to.be.bignumber.equal(amount); 
                return true;
              });  /*
              truffleAssert.eventEmitted(logs, 'Transfer', {
                from: tokenOwner,
                to: to,
                value: amount,
              });*/
               
            });

            it('emits an approval event', async function () {
              //const { logs } = await this.token.transferFrom(tokenOwner, to, amount, { from: spender });
              const  logs  = await this.token.transferFrom(tokenOwner, to, amount, { from: spender });

              const val = await this.token.allowance(tokenOwner, spender);
              truffleAssert.eventEmitted(logs, 'Approval', (ev) => {
                expect (ev.owner).to.equal(tokenOwner);
                expect (ev.spender).to.equal(spender);
                expect (ev.value).to.be.bignumber.equal(val); 
                return true;
              });  
              //truffleAssert.eventEmitted(logs, 'Approval', {
              //  owner: tokenOwner,
              //  spender: spender,
              //  value: await this.token.allowance(tokenOwner, spender),
              //});
 
            });
          });

          describe('when the token owner does not have enough balance', function () {
            const amount = initialSupply.addn(1);

            it('reverts', async function () {
              await truffleAssert.reverts(this.token.transferFrom(
                tokenOwner, to, amount, { from: spender }), `transfer amount exceeds balance`,
              );
              /*await expectRevert(this.token.transferFrom(
                tokenOwner, to, amount, { from: spender }), `${errorPrefix}: transfer amount exceeds balance`,
              );*/
            });
          });
        });

        describe('when the spender does not have enough approved balance', function () {
          beforeEach(async function () {
            await this.token.approve(spender, initialSupply.subn(1), { from: tokenOwner });
          });

          describe('when the token owner has enough balance', function () {
            const amount = initialSupply;

            it('reverts', async function () {
              await truffleAssert.reverts(this.token.transferFrom(
                tokenOwner, to, amount, { from: spender }), `transfer amount exceeds allowance`,
              );
              /*await expectRevert(this.token.transferFrom(
                tokenOwner, to, amount, { from: spender }), `${errorPrefix}: transfer amount exceeds allowance`,
              );*/
            });
          });

          describe('when the token owner does not have enough balance', function () {
            const amount = initialSupply.addn(1);

            it('reverts', async function () { 
              await truffleAssert.reverts(this.token.transferFrom(
                tokenOwner, to, amount, { from: spender }), `transfer amount exceeds balance`,
              );
              /*await expectRevert(this.token.transferFrom(
                tokenOwner, to, amount, { from: spender }), `${errorPrefix}: transfer amount exceeds balance`,
              );*/
            });
          });
        });
      });

      describe('when the recipient is the zero address', function () {
        const amount = initialSupply;
        const to = ZERO_ADDRESS;

        beforeEach(async function () {
          await this.token.approve(spender, amount, { from: tokenOwner });
        });

        it('reverts', async function () {
          await truffleAssert.reverts(this.token.transferFrom(
            tokenOwner, to, amount, { from: spender }), `transfer to the zero address`,
          );
          /*await expectRevert(this.token.transferFrom(
            tokenOwner, to, amount, { from: spender }), `${errorPrefix}: transfer to the zero address`,
          );*/
        });
      });
    });

    describe('when the token owner is the zero address', function () {
      const amount = 0;
      const tokenOwner = ZERO_ADDRESS;
      const to = recipient;

      it('reverts', async function () {
        await truffleAssert.reverts(this.token.transferFrom(
          tokenOwner, to, amount, { from: spender }), `transfer from the zero address`,
        );
        /*await expectRevert(this.token.transferFrom(
          tokenOwner, to, amount, { from: spender }), `${errorPrefix}: transfer from the zero address`,
        );*/
      });
    });
  });

  describe('approve', function () {
    shouldBehaveLikeERC20Approve(errorPrefix, initialHolder, recipient, initialSupply,
      function (owner, spender, amount) {
        return this.token.approve(spender, amount, { from: owner });
      },
    );
  });
}

function shouldBehaveLikeERC20Transfer (errorPrefix, from, to, balance, transfer) {
  describe('when the recipient is not the zero address', function () {
    describe('when the sender does not have enough balance', function () {
      const amount = balance.addn(1); 

     // expect(await this.token.balanceOf(from)).to.be.bignumber.equal('0');

      it('reverts', async function () {
        //expect(await this.token.balanceOf(from)).to.be.bignumber.equal(amount);  
        await truffleAssert.reverts(
          transfer.call(this, from, to, amount),
          `transfer amount exceeds balance`,
        );
        /*await expectRevert(transfer.call( to, amount),
          `${errorPrefix}: transfer amount exceeds balance`,
        ); */
      }); 
    });

    describe('when the sender transfers all balance', function () {
      const amount = balance;

      it('transfers the requested amount', async function () {
        await transfer.call(this, from, to, amount);

        expect(await this.token.balanceOf(from)).to.be.bignumber.equal('0');

        expect(await this.token.balanceOf(to)).to.be.bignumber.equal(amount);
      });

      it('emits a transfer event', async function () {
        //const { logs } = await transfer.call(this, from, to, amount);
        const logs = await transfer.call(this, from, to, amount);
        
        
        truffleAssert.eventEmitted(logs, 'Transfer', (ev) => {
          expect (ev.from).to.equal(from);
          expect (ev.to).to.equal(to);
          expect (ev.value).to.be.bignumber.equal(amount);  
          return true;
        }); 
        /*truffleAssert.eventEmitted(logs, 'Transfer', {
          from,
          to,
          value: amount,
        });*/ 
      });
    });

    describe('when the sender transfers zero tokens', function () {
      const amount = new BN('0');

      it('transfers the requested amount', async function () {
        await transfer.call(this, from, to, amount);

        expect(await this.token.balanceOf(from)).to.be.bignumber.equal(balance);

        expect(await this.token.balanceOf(to)).to.be.bignumber.equal('0');
      });

      it('emits a transfer event', async function () {
        //const { logs } = await transfer.call(this, from, to, amount);
        const  logs  = await transfer.call(this, from, to, amount);

        truffleAssert.eventEmitted(logs, 'Transfer', (ev) => {
          expect (ev.from).to.equal(from);
          expect (ev.to).to.equal(to);
          expect (ev.value).to.be.bignumber.equal(amount); 
          return true;
        });  
      });
    });
  });

  describe('when the recipient is the zero address', function () {
    it('reverts', async function () {
      await truffleAssert.reverts(transfer.call(this, from, ZERO_ADDRESS, balance),
      `transfer to the zero address`,
      );
      /*await expectRevert(transfer.call(this, from, ZERO_ADDRESS, balance),
        `transfer to the zero address`,
      );*/
    });
  });
}

function shouldBehaveLikeERC20Approve (errorPrefix, owner, spender, supply, approve) {
  describe('when the spender is not the zero address', function () {
    describe('when the sender has enough balance', function () {
      const amount = supply;

      it('emits an approval event', async function () {
        //const { logs } = await approve.call(this, owner, spender, amount);
        const  logs  = await approve.call(this, owner, spender, amount);

        truffleAssert.eventEmitted(logs, 'Approval', (ev) => {
          expect (ev.owner).to.equal(owner);
          expect (ev.spender).to.equal(spender);
          expect (ev.value).to.be.bignumber.equal(amount); 
          return true;
        });  
      });

      describe('when there was no approved amount before', function () {
        it('approves the requested amount', async function () {
          await approve.call(this, owner, spender, amount);

          expect(await this.token.allowance(owner, spender)).to.be.bignumber.equal(amount);
        });
      });

      describe('when the spender had an approved amount', function () {
        beforeEach(async function () {
          await approve.call(this, owner, spender, new BN(1));
        });

        it('approves the requested amount and replaces the previous one', async function () {
          await approve.call(this, owner, spender, amount);

          expect(await this.token.allowance(owner, spender)).to.be.bignumber.equal(amount);
        });
      });
    });

    describe('when the sender does not have enough balance', function () {
      const amount = supply.addn(1);

      it('emits an approval event', async function () {
        //const { logs } = await approve.call(this, owner, spender, amount);
        const  logs  = await approve.call(this, owner, spender, amount);

        truffleAssert.eventEmitted(logs, 'Approval', (ev) => {
          expect (ev.owner).to.equal(owner);
          expect (ev.spender).to.equal(spender);
          expect (ev.value).to.be.bignumber.equal(amount); 
          return true;
        });   
      });

      describe('when there was no approved amount before', function () {
        it('approves the requested amount', async function () {
          await approve.call(this, owner, spender, amount);

          expect(await this.token.allowance(owner, spender)).to.be.bignumber.equal(amount);
        });
      });

      describe('when the spender had an approved amount', function () {
        beforeEach(async function () {
          await approve.call(this, owner, spender, new BN(1));
        });

        it('approves the requested amount and replaces the previous one', async function () {
          await approve.call(this, owner, spender, amount);

          expect(await this.token.allowance(owner, spender)).to.be.bignumber.equal(amount);
        });
      });
    });
  });

  describe('when the spender is the zero address', function () {
    it('reverts', async function () {
      await truffleAssert.reverts(approve.call(this, owner, ZERO_ADDRESS, supply),
      `approve to the zero address`,
      );
      /*await expectRevert(approve.call(this, owner, ZERO_ADDRESS, supply),
        `${errorPrefix}: approve to the zero address`,
      );*/
    });
  });
}

module.exports = {
  shouldBehaveLikeERC20,
  shouldBehaveLikeERC20Transfer,
  shouldBehaveLikeERC20Approve,
};
