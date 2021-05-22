// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity 0.7.5;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";
import "../interfaces/IAuthorities.sol";

/**
 * @title Authorities
 *
 * @dev Bundles Access Control and Pausable contracts in one.
 *
 */
abstract contract Authorities is IAuthorities, Pausable, AccessControl {

    /**
    * @dev Modifier for checking whether the caller is an admin.
    */
    modifier onlyAdmin() {
        require(hasRole(DEFAULT_ADMIN_ROLE, msg.sender), "Authorities: access denied");
        _;
    }
    /**
     * @dev Grants `DEFAULT_ADMIN_ROLE`, `PAUSER_ROLE` to the admin account.
     */
    constructor(address _admin) {
        _setupRole(DEFAULT_ADMIN_ROLE, _admin);
        _setupRole(TOKEN_BURNER_ROLE, _admin);
        _setupRole(TOKEN_MINTER_ROLE, _admin);
        _setupRole(TOKEN_SENDER_ROLE, _admin);
        _setupRole(TOKEN_REVOKER_ROLE, _admin);
        _setupRole(TOKEN_OPERATOR_ROLE, _admin);
        _setupRole(COLLECTION_SITE_REVOKER_ROLE, _admin);
        _setupRole(COLLECTION_SITE_ADMIN_ROLE, _admin);
        _setupRole(COLLECTION_SITE_CREATOR_ROLE, _admin);
        _setupRole(COLLECTION_SITE_DESTROYER_ROLE, _admin);
    }

    /**
     * @dev See {IAuthorities-isAdmin}.
     */
    function isAdmin(address _account) external override view returns (bool) {
        return hasRole(DEFAULT_ADMIN_ROLE, _account);
    }

    /**
     * @dev See {IAuthorities-addAdmin}.
     */
    function addAdmin(address _account) external override {
        grantRole(DEFAULT_ADMIN_ROLE, _account);
    }

    /**
     * @dev See {IAuthorities-removeAdmin}.
     */
    function removeAdmin(address _account) external override {
        revokeRole(DEFAULT_ADMIN_ROLE, _account);
    }
}