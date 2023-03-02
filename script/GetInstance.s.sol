// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/************************************************
* Author: Navinavu (https://github.com/NaviNavu)
*************************************************/

import "forge-std/Script.sol";
import "forge-std/Vm.sol";
import { Ethernaut, Level } from "internals/ethernaut-core/Ethernaut.sol";
import { Box } from "internals/contracts/Box.sol";
import { EnvironmentData } from "internals/EnvironmentData.sol";
import { LevelCollection } from "internals/LevelCollection.sol";

contract GetInstance is Script, EnvironmentData, LevelCollection {
    function run(string memory _levelName) public {
        require(envData.box.code.length > 0, 
            "The Box is not started. Use the StartBox script to start it: forge script StartBox --broadcast --rpc-url local"
        );
        
        Box box = Box(envData.box);
        Level level = Level(levelCollection.levels[keccak256(bytes(_levelName))]);
        
        vm.recordLogs();
        vm.startBroadcast(envData.playerPK);
       
        Ethernaut(envData.ethernaut).createLevelInstance(level);

        Vm.Log[] memory entries = vm.getRecordedLogs();
        
        require(
            entries.length != 0 
            && entries[0].topics[0] == keccak256("LevelInstanceCreatedLog(address,address,address)"),
            "Unable to retrieve emitted level instance creation logs."
        );
    
        address instanceAddress = address(uint160(uint256(entries[0].topics[2])));

        box.setCurrentLevelInstance(payable(instanceAddress));
        vm.stopBroadcast();

        _logLevelInstanceCreation(_levelName, instanceAddress);
    }

    function _logLevelInstanceCreation(string memory levelName, address at) private view  {
        console.log("\n[ %s ]", levelName);
        console.log("Level instance: %s ", at);
        console.log("Happy hacking!");
    }
}
