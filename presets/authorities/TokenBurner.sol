// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.7.5;

import "@openzeppelin/contracts/access/AccessControl.sol";

abstract contract TokenBurnerAuthority is AccessControl {
    bytes32 public constant TOKEN_BURNER_ROLE = keccak256("TOKEN_BURNER_ROLE");

    /**
     * @dev See {IAuthorities-isAdmin}.
     */
    function isTokenBurner(address _account) external override view returns (bool) {
        return hasRole(TOKEN_BURNER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-addAdmin}.
     */
    function addTokenBurner(address _account) external override {
        grantRole(TOKEN_BURNER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-removeAdmin}.
     */
    function removeTokenBurner(address _account) external override {
        revokeRole(TOKEN_BURNER_ROLE, _account);
    }
}