// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/************************************************
* Author: Navinavu (https://github.com/NaviNavu)
*************************************************/

import "forge-std/Script.sol";
import { LibLogs } from "internals/libraries/LibLogs.sol";
import { Box } from "internals/contracts/Box.sol";
import { EnvironmentData } from "internals/EnvironmentData.sol";

contract StartBox is Script, EnvironmentData {
    function run() public {
        require(envData.box.code.length == 0, 
            "The Box is already running. To kill it, restart or quit Anvil."
        );

        vm.startBroadcast(envData.playerPK);
        Box box = new Box{salt:"42424242424242424242424242424242"}(envData.ethernaut);
        vm.stopBroadcast();

        require(address(box) == envData.box, "Wrong Box contract creation salt.");

        LibLogs.logBoxCreation(address(box));
    }
}
