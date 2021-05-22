// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

abstract contract TokenMinterAuthority is AccessControl {
    bytes32 public constant TOKEN_MINTER_ROLE = keccak256("TOKEN_MINTER_ROLE");

    /**
     * @dev See {IAuthorities-isAdmin}.
     */
    function isTokenMinter(address _account) external override view returns (bool) {
        return hasRole(TOKEN_MINTER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-addAdmin}.
     */
    function addTokenMinter(address _account) external override {
        grantRole(TOKEN_MINTER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-removeAdmin}.
     */
    function removeTokenMinter(address _account) external override {
        revokeRole(TOKEN_MINTER_ROLE, _account);
    }
}