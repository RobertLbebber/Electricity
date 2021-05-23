const hre = require( "hardhat");
import { Artifact } from "hardhat/types";
import { expect } from "chai";
// import ethers from "hardhat";
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/dist/src/signer-with-address";

import { Signers } from "../types";
// import {abi,bytecode} from "../bin/contracts/operators/Authenticator.json";

import  { Authenticator } from "../typechain/Authenticator";

const { deployContract } = hre.waffle;
const { contractSettings, contracts } = require('../deployments/settings');

// const Authenticator = artifacts.require('Authenticator');

describe("Unit tests", function () {
  let authenticator;
  before(async function () {
    this._master = contractSettings.admin;// address

    this.signers = {} as Signers;

    const signers: SignerWithAddress[] = await hre.ethers.getSigners();
    this.signers.admin = signers[0];
  });

  describe("Authenticator", function () {

    beforeEach(async function () {
      const greeterArtifact: Artifact = await hre.artifacts.readArtifact("Authenticator");
      this.authenticator = <Authenticator>await deployContract(this.signers.admin, greeterArtifact, [this._master]);
    });

    it("should say Hi", async function () {
      expect(await this.authenticator.sayHi()).to.equal("Hi");
    });
  });
});
