// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "./Roles.sol";

abstract contract CollectionSiteAdminAuthority is AccessControl {

    /**
     * @dev See {IAuthorities-isAdmin}.
     */
    function isCollectionSiteAdmin(address _account) external  view returns (bool) {
        return hasRole(Roles.COLLECTION_SITE_ADMIN_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-addAdmin}.
     */
    function addCollectionSiteAdmin(address _account) external  {
        grantRole(Roles.COLLECTION_SITE_ADMIN_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-removeAdmin}.
     */
    function removeCollectionSiteAdmin(address _account) external  {
        revokeRole(Roles.COLLECTION_SITE_ADMIN_ROLE, _account);
    }
}