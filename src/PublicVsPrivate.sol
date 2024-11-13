// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract PublicVariable {
    // Public variable with automatic getter function
    uint256 public value;

    constructor(uint256 _initialValue) {
        value = _initialValue;
    }

    // Function to update the value
    function updateValue(uint256 _newValue) public {
        value = _newValue;
    }
}

contract PrivateVariable {
    // Private variable with manual getter function
    uint256 private value;

    constructor(uint256 _initialValue) {
        value = _initialValue;
    }

    // Getter function to access the private variable
    function getValue() public view returns (uint256) {
        return value;
    }

    // Function to update the value
    function updateValue(uint256 _newValue) public {
        value = _newValue;
    }
}
