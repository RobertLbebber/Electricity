// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "../../interfaces/IAdmin.sol";
import "./Roles.sol";
import "./CollectionSiteCreatorAuthority.sol";
import "./CollectionSiteDestroyerAuthority.sol";
import "./CollectionSiteRevokerAuthority.sol";
import "./PauserAuthority.sol";
import "./TokenBurnerAuthority.sol";
import "./TokenMinterAuthority.sol";
import "./TokenOperatorAuthority.sol";
import "./TokenRevokerAuthority.sol";
import "./TokenSenderAuthority.sol";

/**
 * @title Authorities
 *
 * @dev Bundles Access Control and Pausable contracts in one.
 *
 */
abstract contract Admin is IAdmin, AccessControl {
    /**
    * @dev Modifier for checking whether the caller is an admin.
    */
    modifier onlyAdmin() {
        require(hasRole(DEFAULT_ADMIN_ROLE, msg.sender), "Admin: access denied");
        _;
    }
    /**
     * @dev Grants `DEFAULT_ADMIN_ROLE`, `PAUSER_ROLE` to the admin account.
     */
    constructor(address _admin) {
        _setupRole(DEFAULT_ADMIN_ROLE, _admin);
        _setupRole(Roles.COLLECTION_SITE_ADMIN_ROLE , _admin);
        _setupRole(Roles.PAUSER_ROLE , _admin);
        _setupRole(Roles.TOKEN_BURNER_ROLE , _admin);
        _setupRole(Roles.TOKEN_MINTER_ROLE , _admin);
        _setupRole(Roles.TOKEN_OPERATOR_ROLE , _admin);
        _setupRole(Roles.TOKEN_REVOKER_ROLE , _admin);
        _setupRole(Roles.TOKEN_SENDER_ROLE , _admin);
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