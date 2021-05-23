// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "./Roles.sol";

abstract contract TokenRevokerAuthority is AccessControl {

    /**
     * @dev See {IAuthorities-isAdmin}.
     */
    function isTokenRevoker(address _account) external  view returns (bool) {
        return hasRole(Roles.TOKEN_REVOKER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-addAdmin}.
     */
    function addTokenRevoker(address _account) external  {
        grantRole(Roles.TOKEN_REVOKER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-removeAdmin}.
     */
    function removeTokenRevoker(address _account) external  {
        revokeRole(Roles.TOKEN_REVOKER_ROLE, _account);
    }
}