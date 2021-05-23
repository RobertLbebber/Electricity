// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol";

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
contract MasterAuthority is AccessControl {
    /**
    * @dev Modifier for checking whether the caller is an admin.
    */
    modifier onlyMaster() {
        require(hasRole(Roles.MASTER_ROLE, msg.sender), "MasterAuthority: access denied");
        _;
    }

    
    /**
     * @dev Grants `DEFAULT_ADMIN_ROLE`, `PAUSER_ROLE` to the admin account.
     */
    constructor(address _admin) {
        _setupRole(Roles.MASTER_ROLE , _admin);
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
    function isMaster(address _account) external view returns (bool) {
        return hasRole(Roles.MASTER_ROLE, _account);
    }

    /**
     * @dev See {IAuthorities-addAdmin}.
     */
    function addMaster(address _account) external  {
        grantRole(Roles.MASTER_ROLE, _account);
    }

    /**
     * @dev See {IAuthorities-removeAdmin}.
     */
    function removeMaster(address _account) external  {
        revokeRole(Roles.MASTER_ROLE, _account);
    }
}