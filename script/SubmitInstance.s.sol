// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/************************************************
* Author: Navinavu (https://github.com/NaviNavu)
*************************************************/

import "forge-std/Script.sol";
import { Vm } from "forge-std/Vm.sol";
import { Ethernaut } from "internals/ethernaut-core/Ethernaut.sol";
import { Box } from "internals/contracts/Box.sol";
import { EnvironmentData } from "internals/EnvironmentData.sol";

contract SubmitInstance is Script, EnvironmentData {
    function run() public {
        require(envData.box.code.length > 0, 
            "The Box is not started. Use the StartBox script to start it: forge script StartBox --rpc-url $LOCALHOST --broadcast"
        );
        
        Box box = Box(envData.box);

        vm.recordLogs();
        vm.startBroadcast(envData.playerPK);

        Ethernaut(envData.ethernaut).submitLevelInstance(box.currentLevelInstance());

        vm.stopBroadcast();

        Vm.Log[] memory entries = vm.getRecordedLogs();

        require(
            entries.length != 0 
            && entries[0].topics[0] == keccak256("LevelCompletedLog(address,address,address)"),
             "[ NOPE :( ]"
        );

        for (uint8 i; i < 20; ++i) {
            console.log("[ CONGRATULATIONS! YOU HAVE COMPLETED THIS LEVEL! :D ]");
        }
    }
}