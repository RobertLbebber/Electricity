// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.7.5;

import "@openzeppelin/contracts/access/AccessControl.sol";

abstract contract TokenSenderAuthority is AccessControl {
    bytes32 public constant TOKEN_SENDER_ROLE = keccak256("TOKEN_SENDER_ROLE");

    /**
     * @dev See {IAuthorities-isAdmin}.
     */
    function isTokenSender(address _account) external override view returns (bool) {
        return hasRole(TOKEN_SENDER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-addAdmin}.
     */
    function addTokenSender(address _account) external override {
        grantRole(TOKEN_SENDER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-removeAdmin}.
     */
    function removeTokenSender(address _account) external override {
        revokeRole(TOKEN_SENDER_ROLE, _account);
    }
}