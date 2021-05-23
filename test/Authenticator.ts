const hre = require( "hardhat");
import { Artifact } from "hardhat/types";
import { expect } from "chai";
// import ethers from "hardhat";
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/dist/src/signer-with-address";

const { expectEvent } = require('@openzeppelin/test-helpers');
import { Signers } from "../types";

import  { Authenticator } from "../typechain/Authenticator";
const {
  impersonateAccount,
} = require('./utils');

const { deployContract } = hre.waffle;
const { contractSettings, contracts } = require('../deployments/settings');

describe("Unit tests", function () {
  before(async function () {
    
    this.signers = {} as Signers;
    
    const signers: SignerWithAddress[] = await hre.ethers.getSigners();
    this.signers.admin = signers[0];
    this._master = this.signers.admin.getAddress();// address
    // await impersonateAccount(this.signers.admin);
  });

  describe("Authenticator", function () {

    beforeEach(async function () {
      // await impersonateAccount(this._master);
      const authenticatorArtifact: Artifact = await hre.artifacts.readArtifact("Authenticator");
      this.authenticator = <Authenticator>await deployContract(this.signers.admin, authenticatorArtifact, [this._master]);
    });

    // it("should say Hi", async function () {
    //   expect(await this.authenticator.sayHi()).to.equal("Hi");
    // });

    it("should be create new nfts",async function () {
      // const cloudOwner = "0x0000000000000000000000000000000000000001";
      const nftReceipt = await this.authenticator.createMarketPlace(this._master);
      expectEvent(nftReceipt, 'Mint');
    })
  });
});
