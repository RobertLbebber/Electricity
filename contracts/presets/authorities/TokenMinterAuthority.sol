// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "./Roles.sol";

abstract contract TokenMinterAuthority is AccessControl {

    constructor(address _admin) {
        _setupRole(Roles.TOKEN_MINTER_ROLE , _admin);
    }

    /**
     * @dev See {IAuthorities-isAdmin}.
     */
    function isTokenMinter(address _account) external  view returns (bool) {
        return hasRole(Roles.TOKEN_MINTER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-addAdmin}.
     */
    function addTokenMinter(address _account) external  {
        grantRole(Roles.TOKEN_MINTER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-removeAdmin}.
     */
    function removeTokenMinter(address _account) external  {
        revokeRole(Roles.TOKEN_MINTER_ROLE, _account);
    }
}