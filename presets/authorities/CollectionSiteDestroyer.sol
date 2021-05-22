// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.7.5;

import "@openzeppelin/contracts/access/AccessControl.sol";

abstract contract CollectionSiteDestroyerAuthority is AccessControl {
    bytes32 public constant COLLECTION_SITE_DESTROYER_ROLE = keccak256("COLLECTION_SITE_DESTROYER_ROLE");

    /**
     * @dev See {IAuthorities-isAdmin}.
     */
    function isCollectionSiteDestroyer(address _account) external override view returns (bool) {
        return hasRole(COLLECTION_SITE_DESTROYER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-addAdmin}.
     */
    function addCollectionSiteDestroyer(address _account) external override {
        grantRole(COLLECTION_SITE_DESTROYER_ROLE, _account);
    }
    /**
     * @dev See {IAuthorities-removeAdmin}.
     */
    function removeCollectionSiteDestroyer(address _account) external override {
        revokeRole(COLLECTION_SITE_DESTROYER_ROLE, _account);
    }
}