// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {ArrayVsMappingA, ArrayVsMappingB} from "../src/ArrayVsMapping.sol"; // Adjust path to match your project structure
import {Test, console} from "forge-std/Test.sol";

contract SimpleArrayTestA is Test {

    ArrayVsMappingA public arrayVsMappingA;

    function setUp() public {
        arrayVsMappingA = new ArrayVsMappingA();
    }

    function test_ArrayVsMappingA() public {
        arrayVsMappingA.addElement(10);
        uint256 firstElement = arrayVsMappingA.getElement(0);
        assertEq(firstElement, 10, "First element should be 10");
    }

}

contract SimpleMappingTestB is Test {
    ArrayVsMappingB public arrayVsMappingB;
    address private testAddress = address(1); // Test address for simulating calls

    function setUp() public {
        arrayVsMappingB = new ArrayVsMappingB();
    }

    function test_AddElement() public {
        vm.prank(testAddress); // Simulate transaction from testAddress
        arrayVsMappingB.addElement(100);

        uint256 storedValue = arrayVsMappingB.storedValues(testAddress);
        assertEq(storedValue, 100, "The stored value should be 100 after adding");
    }

    function test_GetElement() public {
        // Set a value for testAddress
        vm.prank(testAddress);
        arrayVsMappingB.addElement(42);

        // Check the stored value using getElement
        vm.prank(testAddress); // Simulate call from testAddress
        uint256 storedValue = arrayVsMappingB.getElement();

        // Assert that the value returned by getElement is 42
        assertEq(storedValue, 42, "The stored value should be 42");
    }
}
