// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.7.5;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";

abstract contract PauserAuthority is AccessControl, Pausable {
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");

    /**
    * @dev Modifier for checking whether the caller is a pauser.
    */
    modifier onlyPauser() {
        require(hasRole(PAUSER_ROLE, msg.sender), "Authorities: access denied");
        _;
    }

    /**
     * @dev See {IAuthorities-isPauser}.
     */
    function isPauser(address _account) external override view returns (bool) {
        return hasRole(PAUSER_ROLE, _account);
    }

    /**
     * @dev See {IAuthorities-addPauser}.
     */
    function addPauser(address _account) external override {
        grantRole(PAUSER_ROLE, _account);
    }

    /**
     * @dev See {IAuthorities-removePauser}.
     */
    function removePauser(address _account) external override {
        revokeRole(PAUSER_ROLE, _account);
    }

    /**
     * @dev See {IAuthorities-pause}.
     */
    function pause() external override onlyPauser {
        _pause();
    }

    /**
     * @dev See {IAuthorities-unpause}.
     */
    function unpause() external override onlyPauser {
        _unpause();
    }
}