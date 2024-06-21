// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";

contract CounterScript is Script {
    uint256 ANVIL_DEFAULT_KEY = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;
    address ANVIL_DEFAULT_ADDRESS = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;

    function setUp() public {}

    function run() public view returns (uint8) {
        bytes32 digest = bytes32("hi");

        uint8 v;
        bytes32 r;
        bytes32 s;
        /*//////////////////////////////////////////////////////////////
                           START WORK AROUND
        //////////////////////////////////////////////////////////////*/
        if (block.chainid == 31337) {
            (v, r, s) = vm.sign(ANVIL_DEFAULT_KEY, digest);
        } else {
            // It'll use whatever account is unlocked, BUT there is no unlocked account for tests
            (v, r, s) = vm.sign(digest);
        }
        /*//////////////////////////////////////////////////////////////
                            END WORK AROUND
        //////////////////////////////////////////////////////////////*/

        /*//////////////////////////////////////////////////////////////
                            START IDEAL CODE
        //////////////////////////////////////////////////////////////*/
        // (v, r, s) = vm.sign(digest);
        // // It should be smart enough to use the anvil default unlocked account
        // // or, maybe I can pass like "default account" as the address or something.
        /*//////////////////////////////////////////////////////////////
                             END IDEAL CODE
        //////////////////////////////////////////////////////////////*/
        return v;
    }
}
