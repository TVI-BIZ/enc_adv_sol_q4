// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "../src/ArrayVsMapping.sol"; // Adjust path to match your project structure
import {Test, console} from "forge-std/Test.sol";

contract SimpleArrayTest is Test {
    ArryaVsMappingB private simpleArray;

    function setUp() public {
        simpleArray = new ArryaVsMappingB();
    }

    function testAddElement() public {
        simpleArray.addElement(10);
        simpleArray.addElement(20);

        uint256 firstElement = simpleArray.getElement(0);
        uint256 secondElement = simpleArray.getElement(1);

        assertEq(firstElement, 10, "First element should be 10");
        assertEq(secondElement, 20, "Second element should be 20");
    }

    function testGetElementValidIndex() public {
        // Add elements to the array
        simpleArray.addElement(10);

        // Retrieve and check each element
        uint256 firstElement = simpleArray.getElement(0);

        assertEq(firstElement, 10, "First element should be 10");
    }
}

contract SimpleMappingTest is Test {
    ArryaVsMappingA private simpleMapping;
    address private testAddress = address(1); // Test address for simulating calls

    function setUp() public {
        simpleMapping = new ArryaVsMappingA();
    }

    function testAddElement() public {
        vm.prank(testAddress); // Simulate transaction from testAddress
        simpleMapping.addElement(100);

        uint256 storedValue = simpleMapping.storedValues(testAddress);
        assertEq(storedValue, 100, "The stored value should be 100 after adding");
    }

    function testGetElement() public {
        // Set a value for testAddress
        vm.prank(testAddress);
        simpleMapping.addElement(42);

        // Check the stored value using getElement
        vm.prank(testAddress); // Simulate call from testAddress
        uint256 storedValue = simpleMapping.getElement();

        // Assert that the value returned by getElement is 42
        assertEq(storedValue, 42, "The stored value should be 42");
    }
}
