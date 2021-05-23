// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "./Roles.sol";

abstract contract CollectionSiteDestroyerAuthority is AccessControl {

    constructor(address _admin) {
        _setupRole(Roles.COLLECTION_SITE_DESTROYER_ROLE , _admin);
    }

    /**
     * @dev See {IAuthorities-isAdmin}.
     */
    function isCollectionSiteDestroyer(address _account) external  view returns (bool) {
        return hasRole(Roles.COLLECTION_SITE_DESTROYER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-addAdmin}.
     */
    function addCollectionSiteDestroyer(address _account) external  {
        grantRole(Roles.COLLECTION_SITE_DESTROYER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-removeAdmin}.
     */
    function removeCollectionSiteDestroyer(address _account) external  {
        revokeRole(Roles.COLLECTION_SITE_DESTROYER_ROLE, _account);
    }
}