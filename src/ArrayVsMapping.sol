// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

// contract Mapping {
//     mapping(address => uint256) public balances;

//     function updateBalance(uint256 _newBalance) public {
//         balances[msg.sender] = _newBalance;
//     }

//     function getBalance() public view returns (uint256) {
//         return balances[msg.sender];
//     }
// }

contract ArryaVsMappingA {
    mapping(address => uint256) public storedValues;

    // Adds a value to the caller's address
    function addElement(uint256 _value) public {
        storedValues[msg.sender] = _value;
    }

    // Get the stored value for the caller's address
    function getElement() public view returns (uint256) {
        return storedValues[msg.sender];
    }
}

contract ArryaVsMappingB {
    uint256[] public array;

    // Adds a new element to the array
    function addElement(uint256 _value) public {
        array.push(_value);
    }

    // Retrieves an element from the array by index
    function getElement(uint256 _index) public view returns (uint256) {
        require(_index < array.length, "Index out of bounds");
        return array[_index];
    }
}
