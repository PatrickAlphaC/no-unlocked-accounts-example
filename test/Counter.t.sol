// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";
import {CounterScript} from "script/Counter.s.sol";

contract CounterTest is Test {
    Counter public counter;
    CounterScript public counterScript;

    function setUp() public {
        counter = new Counter();
        counterScript = new CounterScript();
    }

    function testGetV() public view {
        uint8 v = counterScript.run();
        assert(v > 1);
    }
}
