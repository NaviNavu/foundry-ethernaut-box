# Ethernaut Foundry Box

A Foundry x Ethernaut Box to locally test your Ethernaut exploits before submission (and train your Foundry skills!).

##### Examples of what you can do:
- Fork Goerli and get a local instance of an Ethernaut level
- Interact with a local level instance via Cast
- Run scripts and tests against a local level instance with Forge
- Write and deploy contracts on the local environment
- Submit the level instance to verify the validity of your exploit
- [Read the Foundry Book](https://book.getfoundry.sh/)

### SETUP
Before to start hacking, Foundry must be installed on your machine.
[Read the Foundry Book](https://book.getfoundry.sh/).

Then you can clone this repo and build the project:
```bash
git clone https://github.com/NaviNavu/foundry-ethernaut-box.git
cd foundry-ethernaut-box
forge install
forge build
source .env
```

### HOW TO HACK

#### ⑂ Fork Goerli testnet state
Open a new terminal window then fork Goerli into Anvil in your terminal to retrieve Ethernaut's core contracts and levels:
```bash
# This is the Goerli Infura Demo endpoint, you can change it if needed
anvil --fork-url "https://goerli.infura.io/v3/9aa3d95b3bc440fa88ea12eaa4456161"
```

#### ‣ Start your box

Get back to the project terminal window then run the `StartBox` script to deploy your Box contract on the forked local environment:
```bash
forge script StartBox --broadcast --rpc-url $LOCALHOST
```

On successful deployment, you should see the following at the top of the command output signaling that your Box contract has been correctly deployed:
```bash
Script ran successfully.

== Logs ==

  [ Ethernaut x Foundry Box ]
  Your Box has been correctly deployed at 0x... 
  Available scripts:
  - GetInstance (Loads a level instance into your Box) -> forge script GetInstance --sig "run(string)" "HelloEthernaut" --rpc-url $LOCALHOST --broadcast
  - SubmitInstance (Submits your current level instance) -> forge script SubmitInstance --rpc-url $LOCALHOST --broadcast --private-key $PLAYER_PK

  ## Setting up (1) EVMs.

==========================

```

#### ⎌ Load a level instance into your box
You can load a level instance into your box by running the `GetInstance` script with the level name as argument.
The script will call the main Ethernaut contract that will then deploy a new instance of the level for you. For example, to load the `HelloEthernaut` level into your box:
```bash
forge script GetInstance \
--sig "run(string)" "HelloEthernaut" \
--rpc-url $LOCALHOST \
--broadcast
```

On successful deployment, you should see the following at the top of the command output signaling that the level instance has been correctly created and loaded into your box:
```bash
Script ran successfully.

== Logs ==

[ HelloEthernaut ]
  Level instance deployed at 0x... and correctly loaded into your Box.
  
Happy hacking!

## Setting up (1) EVMs.

==========================
```

You can run the `GetInstance` script again to load a clean instance of the level or another Ethernaut level instance into your box.

**Note:** *a list of level names is available at the end of this README or inside the `LevelCollection` source file*.

#### ⌁ Interact with a level instance
[Read the Foundry Book](https://book.getfoundry.sh/) 😜



#### ⎆ Submit your level instance
You can submit you current level instance to verify if your exploit is successful by running the `SubmitInstance` script: 

```bash
forge script SubmitInstance --rpc-url $LOCALHOST --broadcast 
```

On successful exploit, you should see the following at the top of the command output:
```bash
Script ran successfully.

== Logs ==

  [ CONGRATULATIONS! YOU HAVE COMPLETED THIS LEVEL! :D ]
  [ CONGRATULATIONS! YOU HAVE COMPLETED THIS LEVEL! :D ]
  [ CONGRATULATIONS! YOU HAVE COMPLETED THIS LEVEL! :D ]
  ...

  ## Setting up (1) EVMs.

==========================

```

Or the following if the exploit failed:
```bash
Error: 
[ NOPE :( ]
```


---


### NOTES

Three environment variables are made available for you to use through the levels. These are accessible directly in the CLI but also in your tests and scripts files by loading the variable value with the `vm.envType()` cheatcode.
For example, you can load the player address into a test file by retrieving it as follow: `address player = vm.envAddress("PLAYER")`.

- `$LOCALHOST` is your default local Anvil environment RPC endpoint (127.0.0.1:8545) 
- `$PLAYER_PK` is your Anvil private key (Anvil PK key 0). Use it to sign TXs while using `cast send` or broadcasting script instructions.
- `$PLAYER` is your Anvil address (Anvil Account key 0) derived from the above private key. Use it to "prank" accounts in your tests or, for example, as `--from` value in the CLI.

**If the variables are not defined at first or if you modify them inside the `.env` file, use the `source .env` command to load them into your environment.**


### LEVELS
- HelloEthernaut
- Fallback
- Fallout
- CoinFlip
- Telephone
- Token
- Delegation
- Force
- Vault
- King
- Reentrancy
- Elevator
- Privacy
- GatekeeperOne
- GatekeeperTwo
- NaughtCoin
- Preservation
- Recovery
- MagicNumber
- AlienCodex
- Denial
- Shop
- Dex
- DexTwo
- PuzzleWallet
- Motorbike
- DoubleEntryPoint
- GoodSamaritan
- GatekeeperThree
 