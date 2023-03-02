// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/************************************************
* Author: Navinavu (https://github.com/NaviNavu)
*************************************************/

struct Collection {
  mapping (bytes32 => address) levels;
}

abstract contract LevelCollection  {
    Collection internal levelCollection;

    constructor() {
        levelCollection.levels[keccak256("HelloEthernaut")] = address(0xBA97454449c10a0F04297022646E7750b8954EE8);
        levelCollection.levels[keccak256("Fallback")] = address(0x80934BE6B8B872B364b470Ca30EaAd8AEAC4f63F);
        levelCollection.levels[keccak256("Fallout")] = address(0x0AA237C34532ED79676BCEa22111eA2D01c3d3e7);
        levelCollection.levels[keccak256("CoinFlip")] = address(0x9240670dbd6476e6a32055E52A0b0756abd26fd2);
        levelCollection.levels[keccak256("Telephone")] = address(0x1ca9f1c518ec5681C2B7F97c7385C0164c3A22Fe);
        levelCollection.levels[keccak256("Token")] = address(0xB4802b28895ec64406e45dB504149bfE79A38A57);
        levelCollection.levels[keccak256("Delegation")] = address(0xF781b45d11A37c51aabBa1197B61e6397aDf1f78);
        levelCollection.levels[keccak256("Force")] = address(0x46f79002907a025599f355A04A512A6Fd45E671B);
        levelCollection.levels[keccak256("Vault")] = address(0x3A78EE8462BD2e31133de2B8f1f9CBD973D6eDd6);
        levelCollection.levels[keccak256("King")] = address(0x725595BA16E76ED1F6cC1e1b65A88365cC494824);
        levelCollection.levels[keccak256("Reentrancy")] = address(0x573eAaf1C1c2521e671534FAA525fAAf0894eCEb); 
        levelCollection.levels[keccak256("Elevator")] = address(0x4A151908Da311601D967a6fB9f8cFa5A3E88a251);
        levelCollection.levels[keccak256("Privacy")] = address(0xcAac6e4994c2e21C5370528221c226D1076CfDAB);
        levelCollection.levels[keccak256("GatekeeperOne")] = address(0x2a2497aE349bCA901Fea458370Bd7dDa594D1D69);
        levelCollection.levels[keccak256("GatekeeperTwo")] = address(0xf59112032D54862E199626F55cFad4F8a3b0Fce9);
        levelCollection.levels[keccak256("NaughtCoin")] = address(0x36E92B2751F260D6a4749d7CA58247E7f8198284);
        levelCollection.levels[keccak256("Preservation")] = address(0x2754fA769d47ACdF1f6cDAa4B0A8Ca4eEba651eC);
        levelCollection.levels[keccak256("Recovery")] = address(0xb4B157C7c4b0921065Dded675dFe10759EecaA6D);
        levelCollection.levels[keccak256("MagicNumber")] = address(0xFe18db6501719Ab506683656AAf2F80243F8D0c0);
        levelCollection.levels[keccak256("AlienCodex")] = address(0x40055E69E7EB12620c8CCBCCAb1F187883301c30);
        levelCollection.levels[keccak256("Denial")] = address(0xD0a78dB26AA59694f5Cb536B50ef2fa00155C488);
        levelCollection.levels[keccak256("Shop")] = address(0xCb1c7A4Dee224bac0B47d0bE7bb334bac235F842);
        levelCollection.levels[keccak256("Dex")] = address(0x9CB391dbcD447E645D6Cb55dE6ca23164130D008);
        levelCollection.levels[keccak256("DexTwo")] = address(0x0b6F6CE4BCfB70525A31454292017F640C10c768);
        levelCollection.levels[keccak256("PuzzleWallet")] = address(0x4dF32584890A0026e56f7535d0f2C6486753624f);
        levelCollection.levels[keccak256("Motorbike")] = address(0x9b261b23cE149422DE75907C6ac0C30cEc4e652A);
        levelCollection.levels[keccak256("DoubleEntryPoint")] = address(0x9451961b7Aea1Df57bc20CC68D72f662241b5493);
        levelCollection.levels[keccak256("GoodSamaritan")] = address(0x8d07AC34D8f73e2892496c15223297e5B22B3ABE);
        levelCollection.levels[keccak256("GatekeeperThree")] = address(0x762db91C67F7394606C8A636B5A55dbA411347c6);
    }
}