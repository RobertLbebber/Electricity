// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

abstract contract CollectionSiteAdminAuthority is AccessControl {
    bytes32 public constant COLLECTION_SITE_ADMIN_ROLE = keccak256("COLLECTION_SITE_ADMIN_ROLE");

    /**
     * @dev See {IAuthorities-isAdmin}.
     */
    function isCollectionSiteAdmin(address _account) external  view returns (bool) {
        return hasRole(COLLECTION_SITE_ADMIN_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-addAdmin}.
     */
    function addCollectionSiteAdmin(address _account) external  {
        grantRole(COLLECTION_SITE_ADMIN_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-removeAdmin}.
     */
    function removeCollectionSiteAdmin(address _account) external  {
        revokeRole(COLLECTION_SITE_ADMIN_ROLE, _account);
    }
}