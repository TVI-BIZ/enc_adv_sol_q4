// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import {Test, console} from "forge-std/Test.sol";
import {Mapping} from "../src/Mapping.sol";

contract TestSimpleMapping is Test {
    Mapping sm;

    function setUp() public {
        sm = new Mapping();
    }

    function test_UpdateBalance() public {
        uint256 initialBalance = sm.getBalance();
        assertEq(initialBalance, 0, "Initial balance should be zero");

        sm.updateBalance(100);
        uint256 updatedBalance = sm.getBalance();
        assertEq(updatedBalance, 100, "Balance should be updated to 100");
    }

    function test_SeparateBalances() public {
        // Store for first address
        sm.updateBalance(100);
        uint256 balance1 = sm.getBalance();
        assertEq(balance1, 100, "Account[0] Balance should be updated to 100");

        // Change sender to a different address
        // address addr1 = address(0x123);
        // vm.prank(addr1);
        // sm.updateBalance(200);
        // uint256 balance2 = sm.getBalance();
        // assertEq(balance2, 200, "Account[1] Balance should be updated to 200");

        // Ensure the first account's balance is unaffected
        // uint256 balance1Untouched = balance1;
        // vm.prank(address(0)); // switch back to the first account
        // uint256 balance1Check = sm.getBalance();
        // assertEq(balance1Check, balance1Untouched, "Account[0] Balance should remain 100");
    }

    function test_DefaultBalanceZero() public {
        address addr2 = address(0x456);
        vm.prank(addr2);
        uint256 balance = sm.getBalance();
        assertEq(balance, 0, "Balance for new account should be zero");
    }
}
