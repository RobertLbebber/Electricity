// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "../../interfaces/IPauser.sol";
import "./Roles.sol";

abstract contract PauserAuthority is AccessControl, Pausable, IPauser {

    constructor(address _admin) {
        _setupRole(Roles.PAUSER_ROLE , _admin);
    }

    /**
    * @dev Modifier for checking whether the caller is a pauser.
    */
    modifier onlyPauser() {
        require(hasRole(Roles.PAUSER_ROLE, msg.sender), "Authorities: access denied");
        _;
    }

    /**
     * @dev See {IAuthorities-isPauser}.
     */
    function isPauser(address _account) external override view returns (bool) {
        return hasRole(Roles.PAUSER_ROLE, _account);
    }

    /**
     * @dev See {IAuthorities-addPauser}.
     */
    function addPauser(address _account) external override {
        grantRole(Roles.PAUSER_ROLE, _account);
    }

    /**
     * @dev See {IAuthorities-removePauser}.
     */
    function removePauser(address _account) external override {
        revokeRole(Roles.PAUSER_ROLE, _account);
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