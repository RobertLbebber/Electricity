// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.7.5;

import "@openzeppelin/contracts/access/AccessControl.sol";

abstract contract TokenOperatorAuthority is AccessControl {
    bytes32 public constant TOKEN_OPERATOR_ROLE = keccak256("TOKEN_OPERATOR_ROLE");

    /**
     * @dev See {IAuthorities-isAdmin}.
     */
    function isTokenOperator(address _account) external override view returns (bool) {
        return hasRole(TOKEN_OPERATOR_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-addAdmin}.
     */
    function addTokenOperator(address _account) external override {
        grantRole(TOKEN_OPERATOR_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-removeAdmin}.
     */
    function removeTokenOperator(address _account) external override {
        revokeRole(TOKEN_OPERATOR_ROLE, _account);
    }
}