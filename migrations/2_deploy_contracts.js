const PostContract = artifacts.require("./PostContract.sol");

module.exports = function(deployer) {
    deployer.deploy(PostContract);
};
