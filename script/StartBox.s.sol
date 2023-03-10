// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/************************************************
* Author: Navinavu (https://github.com/NaviNavu)
*************************************************/

import "forge-std/Script.sol";
import { LibLogs } from "internals/libraries/LibLogs.sol";
import { Box } from "internals/contracts/Box.sol";
import { EnvironmentData } from "internals/EnvironmentData.sol";

contract StartBox is Script, EnvironmentData, LevelCollection {
    function run() public {
        vm.startBroadcast(envData.playerPK);

        

        LibLogs.logBoxCreation(address(box));
    }
}
