// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract Mapping {
    mapping(address => uint256) public balances;

    function updateBalance(uint256 _newBalance) public {
        balances[msg.sender] = _newBalance;
    }

    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}
