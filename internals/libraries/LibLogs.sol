// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Console2.sol";
import "forge-std/StdStyle.sol";

library LibLogs {
    function title(string memory _title) internal pure returns(string memory) {
        return StdStyle.blue(StdStyle.bold(_title));
    }

    function addr(address _address) internal pure returns(string memory) {
        return StdStyle.green(StdStyle.bold(_address));
    }

    function command(string memory _command) internal pure returns(string memory) {
        return StdStyle.italic(StdStyle.dim(_command));
    }

    function logSubmitResult(bool _success) internal view { 
        if (_success) {
            string memory str = "\n";
            for (uint256 i; i < 32; ++i) {
                str = string.concat(str, "[ CONGRATULATIONS! YOU HAVE COMPLETED THIS LEVEL! :D ]\n");
            }

            console2.log(StdStyle.bold(StdStyle.green(str)));
        } else {
            console2.log(StdStyle.bold(StdStyle.red("[ NOPE! :( ]")));
        }
    }

    function logBoxCreation(address box) internal view {
        console2.log("\n[ %s ]", title("Ethernaut x Foundry Box"));
        console2.log("Your Box has been correctly deployed at %s ", addr(box));
        console2.log("Available scripts:");
        console2.log("- %s (Loads a level instance into your Box) -> %s",
            StdStyle.bold("GetInstance"),
            command('forge script GetInstance --sig "run(string)" "HelloEthernaut" --rpc-url $LOCALHOST --broadcast')
        );
        console2.log("- %s (Submits your current level instance) -> %s",
            StdStyle.bold("SubmitInstance"),
            command('forge script SubmitInstance --rpc-url $LOCALHOST --broadcast --private-key $PLAYER_PK')
        );
    }

    function logLevelInstanceCreation(string memory levelName, address at) internal view {
        console2.log("\n[ %s ]", title(levelName));
        console2.log("Level instance deployed at %s and correctly loaded into your Box.", addr(at));
        console2.log("%s", StdStyle.underline(StdStyle.italic("\nHappy hacking!")));
    }
}
