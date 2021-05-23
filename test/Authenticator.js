const { impersonateAccount,stopImpersonatingAccount} = require("./utils");
const { BN,expectEvent } = require('@openzeppelin/test-helpers');
const { artifacts } = require( "hardhat");

const Authenticator=artifacts.require("Authenticator");

contract("Authenticator", function ([sender, ...accounts]) {
  before(async function () {
    this._master = sender;
  });

  contract("Authenticator", function () {

    beforeEach(async function () {
      await impersonateAccount(this._master);

      this.authenticator = await Authenticator.new(this._master);
    });

    after(async function (){ stopImpersonatingAccount(this._master)});

    it("should be create new nfts",async function () {
      const cloudOwner = "0x0000000000000000000000000000000000000001";

      const nftReceipt =await  this.authenticator.createMarketPlace(cloudOwner,{from: this._master,
        balance: new BN(1000000000000000)});
      expectEvent(nftReceipt, 'Mint',{_from:this._master,_to: cloudOwner,_nftTokenId: new BN(1)});
    })
  });
});
