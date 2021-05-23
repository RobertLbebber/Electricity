const hre = require('hardhat');
const { BN, ether} = require('@openzeppelin/test-helpers');
const { SignerWithAddress } =require('@nomiclabs/hardhat-ethers/dist/src/signer-with-address');

function getDepositAmount({ min = new BN('1'), max = ether('1000') } = {}) {
  return ether(Math.random().toFixed(8))
    .mul(max.sub(min))
    .div(ether('1'))
    .add(min);
}

async function impersonateAccount(account) {
  let nowAccount= account;
  if(account instanceof SignerWithAddress){
    nowAccount=await account.getAddress();
  }
  return hre.network.provider.request({
    method: 'hardhat_impersonateAccount',
    params: [nowAccount],
  });
}

async function stopImpersonatingAccount(account) {
  return hre.network.provider.request({
    method: 'hardhat_stopImpersonatingAccount',
    params: [account],
  });
}

async function resetFork() {
  await hre.network.provider.request({
    method: 'hardhat_reset',
    params: [
      {
        forking: {
          jsonRpcUrl: hre.config.networks.hardhat.forking.url,
          blockNumber: hre.config.networks.hardhat.forking.blockNumber,
        },
      },
    ],
  });
}

module.exports = {
  getDepositAmount,
  impersonateAccount,
  stopImpersonatingAccount,
  resetFork,
};