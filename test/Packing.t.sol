// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "forge-std/Test.sol";
import "../src/Packing.sol"; // Adjust the path according to your project structure

contract TestPacking is Test {
    Packing private packing;

    function setUp() public {
        packing = new Packing();
    }

    function testInitialState() public view {
        (uint16 initialProto, uint8 initialFlag, bool initialIsActive) = packing.getData();

        assertEq(initialProto, 65535, "Initial proto should be 65535");
        assertEq(initialFlag, 255, "Initial flag should be 255");
        assertEq(initialIsActive, true, "Initial isActive should be true");
    }

    function testUpdateData() public {
        uint16 newProto = 12345;
        uint8 newFlag = 100;
        bool newIsActive = false;

        packing.updateData(newProto, newFlag, newIsActive);

        (uint16 updatedProto, uint8 updatedFlag, bool updatedIsActive) = packing.getData();

        assertEq(updatedProto, newProto, "Updated proto value should match");
        assertEq(updatedFlag, newFlag, "Updated flag value should match");
        assertEq(updatedIsActive, newIsActive, "Updated isActive value should match");
    }

    function testBoundaryConditions() public {
        // Setting max allowable values without overflow
        uint16 maxProto = type(uint16).max;
        uint8 maxFlag = type(uint8).max;
        bool isActive = true;

        packing.updateData(maxProto, maxFlag, isActive);
        (uint16 afterMaxProto, uint8 afterMaxFlag, bool afterIsActive) = packing.getData();

        assertEq(afterMaxProto, maxProto, "Proto should handle max uint16 value");
        assertEq(afterMaxFlag, maxFlag, "Flag should handle max uint8 value");
        assertEq(afterIsActive, isActive, "Boolean value should be true as set");
    }
}
