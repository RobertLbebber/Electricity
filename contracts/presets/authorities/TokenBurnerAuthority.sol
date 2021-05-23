// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "./Roles.sol";

abstract contract TokenBurnerAuthority is AccessControl {

    /**
     * @dev See {IAuthorities-isAdmin}.
     */
    function isTokenBurner(address _account) external  view returns (bool) {
        return hasRole(Roles.TOKEN_BURNER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-addAdmin}.
     */
    function addTokenBurner(address _account) external  {
        grantRole(Roles.TOKEN_BURNER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-removeAdmin}.
     */
    function removeTokenBurner(address _account) external  {
        revokeRole(Roles.TOKEN_BURNER_ROLE, _account);
    }
}