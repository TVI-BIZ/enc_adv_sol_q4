// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {BytesVsStringsA} from "../src/BytesVsString.sol";
import {BytesVsStringsB} from "../src/BytesVsString.sol";

contract BytesVsStringTest is Test {
    BytesVsStringsA public bytesVsStringsA;
    BytesVsStringsB public bytesVsStringsB;

    function setUp() public {
        bytesVsStringsA = new BytesVsStringsA();
        bytesVsStringsB = new BytesVsStringsB();
    }

    function test_ByteCodeVsStorageVarsA() public view {
        assertEq(bytesVsStringsA.bytes32Var(), "Test bytes32 vs string");
    }

    function test_ByteCodeVsStorageVarsB() public view {
        assertEq(bytesVsStringsB.stringVar(), "Test bytes32 vs string");
    }
}
