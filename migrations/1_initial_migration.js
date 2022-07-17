const CrowdFunding = artifacts.require("CrowdFunding");

module.exports = function (deployer) {
  deployer.deploy(CrowdFunding,"1","crow funding for pets","este es un crowfundig para mascotas", 4);
};
