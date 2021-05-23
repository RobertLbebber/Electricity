/* Autogenerated file. Do not edit manually. */
/* tslint:disable */
/* eslint-disable */

import { Signer, utils, Contract, ContractFactory, Overrides } from "ethers";
import { Provider, TransactionRequest } from "@ethersproject/providers";
import type { Roles, RolesInterface } from "../Roles";

const _abi = [
  {
    inputs: [],
    name: "COLLECTION_SITE_ADMIN_ROLE",
    outputs: [
      {
        internalType: "bytes32",
        name: "",
        type: "bytes32",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "COLLECTION_SITE_CREATOR_ROLE",
    outputs: [
      {
        internalType: "bytes32",
        name: "",
        type: "bytes32",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "COLLECTION_SITE_DESTROYER_ROLE",
    outputs: [
      {
        internalType: "bytes32",
        name: "",
        type: "bytes32",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "COLLECTION_SITE_REVOKER_ROLE",
    outputs: [
      {
        internalType: "bytes32",
        name: "",
        type: "bytes32",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "PAUSER_ROLE",
    outputs: [
      {
        internalType: "bytes32",
        name: "",
        type: "bytes32",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "TOKEN_BURNER_ROLE",
    outputs: [
      {
        internalType: "bytes32",
        name: "",
        type: "bytes32",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "TOKEN_MINTER_ROLE",
    outputs: [
      {
        internalType: "bytes32",
        name: "",
        type: "bytes32",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "TOKEN_OPERATOR_ROLE",
    outputs: [
      {
        internalType: "bytes32",
        name: "",
        type: "bytes32",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "TOKEN_REVOKER_ROLE",
    outputs: [
      {
        internalType: "bytes32",
        name: "",
        type: "bytes32",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [],
    name: "TOKEN_SENDER_ROLE",
    outputs: [
      {
        internalType: "bytes32",
        name: "",
        type: "bytes32",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
];

const _bytecode =
  "0x61027261003a600b82828239805160001a60731461002d57634e487b7160e01b600052600060045260246000fd5b30600052607381538281f3fe73000000000000000000000000000000000000000030146080604052600436106100c85760003560e01c80637d32628e11610080578063b8b4dbe011610065578063b8b4dbe0146101f0578063e63ab1e914610217578063ee403a9c1461023e57600080fd5b80637d32628e146101a2578063868dac78146101c957600080fd5b806333daf980116100b157806333daf9801461012d578063512b336d1461015457806353e26d9e1461017b57600080fd5b806302f4f791146100cd578063234ef96b14610106575b600080fd5b6100f47f0f6276ceca25da37ecf981e5a24d9ed5076048fb70f66ece15d5e81a0b7784f181565b60405190815260200160405180910390f35b6100f47f5979f07f89c2c15858602700438cc8dbb7578fe2a5ff631c0eeecf5fdf38e28a81565b6100f47f62150a51582c26f4255242a3c4ca35fb04250e7315069523d650676aed01a56a81565b6100f47fb3bb6029312d1001076133d40b75b7eca92ba54e4963b3ce24e1486a3d5a038b81565b6100f47f02358c16c6ece4d564dd98c8400ef2ce02ec4ed5a3d53421ef64678a57ac510181565b6100f47f32f1f1918816c13175b4fdb4fd866a30959a9a543260d8c3bc4c46306e0fe74b81565b6100f47fbf92da97948dace2d6f45d7917f1dabf777cd9a311d3aa6c61fcfc330d33bf3881565b6100f47f813b9efdf6afe6b57682eb1fb850711edc34da21ae7f7376cb7a391b1be3239f81565b6100f47f65d7a28e3265b37a6474929f336521b332c1681b933f6cb9f3376673440d862a81565b6100f47f0b61d0f3c02dc80c233efe89f6c7b81119e3c3ce125cdc1a4f67bf5e358762368156fea164736f6c6343000804000a";

export class Roles__factory extends ContractFactory {
  constructor(signer?: Signer) {
    super(_abi, _bytecode, signer);
  }

  deploy(
    overrides?: Overrides & { from?: string | Promise<string> }
  ): Promise<Roles> {
    return super.deploy(overrides || {}) as Promise<Roles>;
  }
  getDeployTransaction(
    overrides?: Overrides & { from?: string | Promise<string> }
  ): TransactionRequest {
    return super.getDeployTransaction(overrides || {});
  }
  attach(address: string): Roles {
    return super.attach(address) as Roles;
  }
  connect(signer: Signer): Roles__factory {
    return super.connect(signer) as Roles__factory;
  }
  static readonly bytecode = _bytecode;
  static readonly abi = _abi;
  static createInterface(): RolesInterface {
    return new utils.Interface(_abi) as RolesInterface;
  }
  static connect(address: string, signerOrProvider: Signer | Provider): Roles {
    return new Contract(address, _abi, signerOrProvider) as Roles;
  }
}