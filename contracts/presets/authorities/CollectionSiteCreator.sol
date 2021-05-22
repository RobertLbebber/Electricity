// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

abstract contract CollectionSiteCreatorAuthority is AccessControl {
    bytes32 public constant COLLECTION_SITE_CREATOR_ROLE = keccak256("COLLECTION_SITE_CREATOR_ROLE");

    /**
     * @dev See {IAuthorities-isAdmin}.
     */
    function isCollectionSiteCreator(address _account) external override view returns (bool) {
        return hasRole(COLLECTION_SITE_CREATOR_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-addAdmin}.
     */
    function addCollectionSiteCreator(address _account) external override {
        grantRole(COLLECTION_SITE_CREATOR_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-removeAdmin}.
     */
    function removeCollectionSiteCreator(address _account) external override {
        revokeRole(COLLECTION_SITE_CREATOR_ROLE, _account);
    }
}