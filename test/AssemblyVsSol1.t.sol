// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {AssemblyVsSol1A} from "../src/AssemblyVsSol1.sol";
import {AssemblyVsSol1B} from "../src/AssemblyVsSol1.sol";

contract AssemblyVsSol1Test is Test {
    AssemblyVsSol1A public assemblyVsSol1A;
    AssemblyVsSol1B public assemblyVsSol1B;

    function setUp() public {
        assemblyVsSol1A = new AssemblyVsSol1A();
        assemblyVsSol1B = new AssemblyVsSol1B();
    }

    function test_AssemblyVsSol1A() public view {
        assertEq(assemblyVsSol1A.getOwner(), address(this));
    }

    function test_AssemblyVsSol1B() public view {
        assertEq(assemblyVsSol1B.getOwner(), address(this));
    }
}
