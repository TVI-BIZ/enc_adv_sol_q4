// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ByteCodeVsStorageVarsA} from "../src/ByteCodeVsStorageVars.sol";
import {ByteCodeVsStorageVarsB} from "../src/ByteCodeVsStorageVars.sol";

contract ByteCodeVsStorageVarsTest is Test {
    ByteCodeVsStorageVarsA public byteCodeVsStorageVarsA;
    ByteCodeVsStorageVarsB public byteCodeVsStorageVarsB;

    function setUp() public {
        byteCodeVsStorageVarsA = new ByteCodeVsStorageVarsA();
        byteCodeVsStorageVarsB = new ByteCodeVsStorageVarsB();
    }

    function test_ByteCodeVsStorageVarsA() public view {
        assertEq(byteCodeVsStorageVarsA.constantGetter(), 1);
    }

    function test_ByteCodeVsStorageVarsB() public view {
        assertEq(byteCodeVsStorageVarsB.s_publicVarStorage(), 1);
    }
}
