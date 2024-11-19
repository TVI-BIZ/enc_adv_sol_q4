// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {FunctionsVsModifiersA} from "../src/FunctionsVsModifiers.sol";
import {FunctionsVsModifiersB} from "../src/FunctionsVsModifiers.sol";

contract FunctionsVsModifiersTest is Test {
    FunctionsVsModifiersA public functionsVsModifiersA;
    FunctionsVsModifiersB public functionsVsModifiersB;

    function setUp() public {
        functionsVsModifiersA = new FunctionsVsModifiersA();
        functionsVsModifiersB = new FunctionsVsModifiersB();
    }

    function test_FunctionsVsModifiersA() public {
        bool testFn = functionsVsModifiersA.ownerAccessTestA(1);
        functionsVsModifiersA.ownerAccessTestB(1);
        assertEq(testFn, true);
    }

    function test_FunctionsVsModifiersB() public {
        bool testFn = functionsVsModifiersB.ownerAccessTestA(1);
        functionsVsModifiersB.ownerAccessTestB(1);
        assertEq(testFn, true);
    }
}
