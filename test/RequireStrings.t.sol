// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import {Test, console} from "forge-std/Test.sol";
import {RequireA} from "../src/RequireStrings.sol";
import {RequireB} from "../src/RequireStrings.sol";

contract RequireStringsTest is Test {
    RequireA public requireA;
    RequireB public requireB;
    address public s_owner;

    function setUp() public {
        requireA = new RequireA();
        requireB = new RequireB();
        s_owner = address(this);
    }

    function test_RequireACtr() public {
        vm.prank(s_owner);
        requireA.testRequireA();
    }

    function test_RequireBCtr() public {
        vm.prank(s_owner);
        requireB.testRequireB();
    }
}
