// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/************************************************
* Author: Navinavu (https://github.com/NaviNavu)
*************************************************/

import "forge-std/Script.sol";
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

        _logBoxCreation(address(box));
    }

     function _logBoxCreation(address box) view private {
        console.log("\n[ Ethernaut Foundry Box ]");
        console.log("Box deployed at: %s", address(box));
        console.log("You can now load a level instance into your box by running the GetInstance script:");
        console.log('> forge script GetInstance --sig "run(string)" "HelloEthernaut" --rpc-url $LOCALHOST --broadcast');
    }
}
