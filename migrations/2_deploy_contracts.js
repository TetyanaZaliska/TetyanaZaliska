const TZTokens = artifacts.require("TZTokens");

module.exports = function (deployer) {
  deployer.deploy(TZTokens);
};