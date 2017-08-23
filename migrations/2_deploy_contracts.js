var ConvertLib = artifacts.require("./ConvertLib.sol");
var MetaCoin = artifacts.require("./MetaCoin.sol");
var People = artifacts.require("./People.sol");
var FernCoin = artifacts.require("./FernCoin.sol");


module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, MetaCoin);
  deployer.deploy(People);
  deployer.deploy(FernCoin);
};
