// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

library Roles{
    bytes32 public constant COLLECTION_SITE_ADMIN_ROLE = keccak256("COLLECTION_SITE_ADMIN_ROLE");
    bytes32 public constant COLLECTION_SITE_CREATOR_ROLE = keccak256("COLLECTION_SITE_CREATOR_ROLE");
    bytes32 public constant COLLECTION_SITE_DESTROYER_ROLE = keccak256("COLLECTION_SITE_DESTROYER_ROLE");
    bytes32 public constant COLLECTION_SITE_REVOKER_ROLE = keccak256("COLLECTION_SITE_REVOKER_ROLE");
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");
    bytes32 public constant TOKEN_BURNER_ROLE = keccak256("TOKEN_BURNER_ROLE");
    bytes32 public constant TOKEN_MINTER_ROLE = keccak256("TOKEN_MINTER_ROLE");
    bytes32 public constant TOKEN_OPERATOR_ROLE = keccak256("TOKEN_OPERATOR_ROLE");
    bytes32 public constant TOKEN_REVOKER_ROLE = keccak256("TOKEN_REVOKER_ROLE");
    bytes32 public constant TOKEN_SENDER_ROLE = keccak256("TOKEN_SENDER_ROLE");
    bytes32 public constant MASTER_ROLE = keccak256("MASTER_ROLE");
}