// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

/**
 * @title foundry-ugprades-f23
 * @author 0xAdesokan
 * @notice 
 */

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

// storage is stored in the proxy, NOT implementation
// constructors are not used in proxy contract
// Proxy -> deploy implementation -> call some "initialize" function


contract  BoxV1 is  Initializable, OwnableUpgradeable, UUPSUpgradeable{
    uint256 internal number;
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    // the initialize is a contructor for proxy
    function initialize() public initializer {
        __Ownable_init(msg.sender); //set owner to msg.sender
        __UUPSUpgradeable_init();
    }


    function  getNumber() external view  returns (uint256) {
        return number;
    }
    function  version() external pure returns (uint256) {
        return 1;
    }
    
    function _authorizeUpgrade(address newImplementation) internal override{}

}