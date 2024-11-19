// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {AssemblyVsSol2A} from "../src/AssemblyVsSol2.sol";
import {AssemblyVsSol2B} from "../src/AssemblyVsSol2.sol";

contract AssemblyVsSol2Test is Test {
    AssemblyVsSol2A public assemblyVsSol2A;
    AssemblyVsSol2B public assemblyVsSol2B;
    uint256 public constant NUM_A = 13;
    uint256 public constant NUM_B = 21;

    function setUp() public {
        assemblyVsSol2A = new AssemblyVsSol2A();
        assemblyVsSol2B = new AssemblyVsSol2B();
    }

    function test_AssemblyVsSol2A() public {
        assemblyVsSol2A.addSolidity(NUM_A,NUM_B);
        assemblyVsSol2A.subSolidity(NUM_B,NUM_A);
        assemblyVsSol2A.mulSolidity(NUM_A,NUM_B);
        assemblyVsSol2A.divSolidity(NUM_B,NUM_A);
        assertEq(assemblyVsSol2A.addition(), (NUM_A + NUM_B));
        assertEq(assemblyVsSol2A.subtraction(), (NUM_B - NUM_A));
        assertEq(assemblyVsSol2A.multiplication(), (NUM_B * NUM_A));
        assertEq(assemblyVsSol2A.division(), (NUM_B / NUM_A));
    }

    function test_AssemblyVsSol2B() public {
        assemblyVsSol2B.addAssembly(NUM_A,NUM_B);
        assemblyVsSol2B.subAssembly(NUM_B,NUM_A);
        assemblyVsSol2B.mulAssembly(NUM_A,NUM_B);
        assemblyVsSol2B.divAssembly(NUM_B,NUM_A);
        assertEq(assemblyVsSol2B.addition(), (NUM_A + NUM_B));
        assertEq(assemblyVsSol2B.subtraction(), (NUM_B - NUM_A));
        assertEq(assemblyVsSol2B.multiplication(), (NUM_B * NUM_A));
        assertEq(assemblyVsSol2B.division(), (NUM_B / NUM_A));
    }
}
