// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/************************************************
* Author: Navinavu (https://github.com/NaviNavu)
*************************************************/

contract Box {
    address public ethernaut;
    address payable public currentLevelInstance;

    constructor(address _ethernaut) {
        ethernaut = _ethernaut;
    }

    function setCurrentLevelInstance(address payable _levelInstance) external {
        currentLevelInstance = _levelInstance;
    }
}