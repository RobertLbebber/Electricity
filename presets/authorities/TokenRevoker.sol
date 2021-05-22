// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.7.5;

import "@openzeppelin/contracts/access/AccessControl.sol";

abstract contract TokenRevokerAuthority is AccessControl {
    bytes32 public constant TOKEN_REVOKER_ROLE = keccak256("TOKEN_REVOKER_ROLE");

    /**
     * @dev See {IAuthorities-isAdmin}.
     */
    function isTokenRevoker(address _account) external override view returns (bool) {
        return hasRole(TOKEN_REVOKER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-addAdmin}.
     */
    function addTokenRevoker(address _account) external override {
        grantRole(TOKEN_REVOKER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-removeAdmin}.
     */
    function removeTokenRevoker(address _account) external override {
        revokeRole(TOKEN_REVOKER_ROLE, _account);
    }
}