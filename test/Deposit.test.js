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
for (const mod of [require.main, module.children]) {
  try {
    mod.require('chai').use(chaiBN);
  } catch (e) {
    // Ignore errors
  }
} 

const ZERO_ADDRESS = '0x0000000000000000000000000000000000000000';
 
const { expect } = require('chai');
const TZTokens = artifacts.require('TZTokens');
const Deposit = artifacts.require('Deposit');

contract('ERC20', function (accounts) {
  const [ initialHolder, recipient, anotherAccount ] = accounts;

  const name = 'TZTokens';
  const symbol = 'TZT';

  const initialSupply = new BN(1000000000);

  beforeEach(async function () {
    //this.token = await TZTokens.new(name, symbol, initialHolder, initialSupply);
    this.deposit = await Deposit.new();
  });
  
  

  describe('get Balance Eth', function () {
    it('when balance is zero', async function () {
        expect(await this.deposit.getBalanceEth(anotherAccount)).to.equal(new BN(0));
    });
  });
});
