const hre = require('hardhat');
const { BN, ether} = require('@openzeppelin/test-helpers');

function getDepositAmount({ min = new BN('1'), max = ether('1000') } = {}) {
  return ether(Math.random().toFixed(8))
    .mul(max.sub(min))
    .div(ether('1'))
    .add(min);
}

async function impersonateAccount(account) {
  return hre.network.provider.request({
    method: 'hardhat_impersonateAccount',
    params: [account],
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