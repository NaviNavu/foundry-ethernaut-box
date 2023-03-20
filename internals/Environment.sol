// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/************************************************
* Author: Navinavu (https://github.com/NaviNavu)
*************************************************/

import "forge-std/Script.sol";

struct EnvData {
    address ethernaut;
    address player;
    address box;
    uint256 playerPK;
}

abstract contract Environment is Script {
    EnvData internal envData;

    constructor() {
      envData.playerPK = vm.envUint("PLAYER_PK");
      envData.player = vm.rememberKey(envData.playerPK);
      envData.ethernaut = address(0xD2e5e0102E55a5234379DD796b8c641cd5996Efd);
      envData.box = address(0x3bf380e9F4fc81cbB8b842C3c3ecf90168cb5A49);
    }
}