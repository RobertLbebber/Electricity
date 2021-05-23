// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "./Roles.sol";

abstract contract TokenSenderAuthority is AccessControl {

    /**
     * @dev See {IAuthorities-isAdmin}.
     */
    function isTokenSender(address _account) external  view returns (bool) {
        return hasRole(Roles.TOKEN_SENDER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-addAdmin}.
     */
    function addTokenSender(address _account) external  {
        grantRole(Roles.TOKEN_SENDER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-removeAdmin}.
     */
    function removeTokenSender(address _account) external  {
        revokeRole(Roles.TOKEN_SENDER_ROLE, _account);
    }
}