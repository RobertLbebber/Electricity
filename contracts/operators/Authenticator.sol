// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts-upgradeable/utils/CountersUpgradeable.sol";
import "hardhat/console.sol";

import "../presets/authorities/Admin.sol";
import "../presets/authorities/MasterAuthority.sol";
import "../presets/authorities/Roles.sol";
import "../tokens/AuthorityFactory.sol";

/**
 * @dev Implementation of https://eips.ethereum.org/EIPS/eip-721[ERC721] Non-Fungible Token Standard, including
 * the Metadata extension, but not including the Enumerable extension, which is available separately as
 * {ERC721Enumerable}.
 */
contract Authenticator is MasterAuthority {
    using Address for address;
    using CountersUpgradeable for CountersUpgradeable.Counter;

    bool private _initialized;
    MasterAuthority private masterAuth;
    address public _master;
    CountersUpgradeable.Counter private counter;

    event Mint(address indexed _from, address indexed _to, uint256 _nftTokenId);

    mapping (address => uint256) private _cloudOwners;

    constructor(address master) MasterAuthority(master){
        _master=master;
        masterAuth= new MasterAuthority(_master);
    }

    function initilizer(address master) public {
        require(!_initialized, "Contract instance has already been initialized");
        _master=master;
        masterAuth.addMaster(_master);
        _initialized=true;
    }
 
    function sayHi() public pure returns(string memory){
        return "Hi";
    }

    function createMarketPlace(address cloudOwner) public onlyMaster {
        CountersUpgradeable.increment(counter);

        uint256 newNftTokenId = CountersUpgradeable.current(counter);
        AuthorityFactory nft=new AuthorityFactory(cloudOwner);
        _cloudOwners[cloudOwner]=newNftTokenId;
        nft.mint(cloudOwner, newNftTokenId);
        console.log(_master ,cloudOwner, newNftTokenId);
        emit Mint(_master ,cloudOwner, newNftTokenId);
    }
}