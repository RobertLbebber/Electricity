// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "./Roles.sol";

abstract contract CollectionSiteCreatorAuthority is AccessControl {

    /**
     * @dev See {IAuthorities-isAdmin}.
     */
    function isCollectionSiteCreator(address _account) external  view returns (bool) {
        return hasRole(Roles.COLLECTION_SITE_CREATOR_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-addAdmin}.
     */
    function addCollectionSiteCreator(address _account) external  {
        grantRole(Roles.COLLECTION_SITE_CREATOR_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-removeAdmin}.
     */
    function removeCollectionSiteCreator(address _account) external  {
        revokeRole(Roles.COLLECTION_SITE_CREATOR_ROLE, _account);
    }
}