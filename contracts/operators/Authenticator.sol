// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts-upgradeable/utils/CountersUpgradeable.sol";

import "../presets/authorities/Admin.sol";
import "../presets/authorities/Roles.sol";
import "../tokens/AuthorityFactory.sol";

/**
 * @dev Implementation of https://eips.ethereum.org/EIPS/eip-721[ERC721] Non-Fungible Token Standard, including
 * the Metadata extension, but not including the Enumerable extension, which is available separately as
 * {ERC721Enumerable}.
 */
contract Authenticator is AccessControl {
    using Address for address;
    using CountersUpgradeable for CountersUpgradeable.Counter;

    bool private _initialized;
    address private _master;
    CountersUpgradeable.Counter private counter;

    event Mint(address indexed _from, address indexed _to, uint256 nftTokenId);

    mapping (address => uint256) private _cloudOwners;

    constructor(address master){
        _master=master;
        _setupRole(Roles.MASTER_ROLE, _master);
    }

    function sayHi() public pure returns(string memory){
        return "Hi";
    }

    function initilizer(address master) public onlyRole(Roles.MASTER_ROLE) {
        require(!_initialized, "Contract instance has already been initialized");
        _master=master;
        _initialized=true;
    }

    function createMarketPlace(address cloudOwner) public onlyRole(Roles.MASTER_ROLE){
        CountersUpgradeable.increment(counter);

        uint256 newNftTokenId = CountersUpgradeable.current(counter);
        AuthorityFactory nft=new AuthorityFactory(cloudOwner);
        _cloudOwners[cloudOwner]=newNftTokenId;
        nft.mint(cloudOwner, newNftTokenId);
        emit Mint(_master ,cloudOwner, newNftTokenId);
    }
}