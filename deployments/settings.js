const hre = require('hardhat');

let contracts, contractSettings;
if (hre.hardhatArguments && hre.hardhatArguments.network === 'goerli') {
  contracts = {
    authenticator: "0x1000000000000000000000000000000000000000",
    authorityFactory: "0x2000000000000000000000000000000000000000" 
  };

  contractSettings = {
    admin: '0x1867c96601bc5fE24F685d112314B8F3Fe228D5A',
    maintainer: '0x1867c96601bc5fE24F685d112314B8F3Fe228D5A',
    VRC: '0x8c5fecdC472E27Bc447696F431E425D02dd46a8c',
    withdrawalCredentials:
      '0x003e294ffc37978496f1b9298d5984ad4d55d4e2d1e6a06ee6904810c7b9e0d5',
    activatedValidators: '0',
    pendingValidators: '1',
    minActivatingDeposit: '5000000000000000000', // 5 ETH
    pendingValidatorsLimit: '500', // 5 %
  };
} else {
  contracts = {
    authenticator: "0x1000000000000000000000000000000000000000",
    authorityFactory: "0x2000000000000000000000000000000000000000"
  };

  contractSettings = {
    admin: '0x144a98cb1CdBb23610501fE6108858D9B7D24934',
    maintainer: '0xf91AA4a655B6F43243ed4C2853F3508314DaA2aB',
    VRC: '0x00000000219ab540356cbb839cbe05303d7705fa',
    withdrawalCredentials:
      '0x0100000000000000000000002296e122c1a20fca3cac3371357bdad3be0df079',
    activatedValidators: '619',
    pendingValidators: '4',
    minActivatingDeposit: '32000000000000000000', // 32 ETH
    pendingValidatorsLimit: '500', // 5 %
  };
}

module.exports = {
  contractSettings,
  contracts,
};