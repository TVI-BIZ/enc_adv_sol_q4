// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;

contract AssemblyVsSol2A {
    uint256 public addition;
    uint256 public subtraction;
    uint256 public multiplication;
    uint256 public division;

    function addSolidity(uint256 a, uint256 b) public {
        addition = a + b;
    }

    function subSolidity(uint256 a, uint256 b) public {
        subtraction = a - b;
    }

    function mulSolidity(uint256 a, uint256 b) public {
        multiplication = a * b;
    }

    function divSolidity(uint256 a, uint256 b) public {
        require(b != 0, "division by zero");
        division = a / b;
    }
}

contract AssemblyVsSol2B {
    uint256 public addition;
    uint256 public subtraction;
    uint256 public multiplication;
    uint256 public division;

    function addAssembly(uint256 a, uint256 b) public {
        assembly {
            sstore(0x0, add(a, b))
        }
    }

    function subAssembly(uint256 a, uint256 b) public {
        assembly {
            sstore(0x1, sub(a, b))
        }
    }

    function mulAssembly(uint256 a, uint256 b) public {
        assembly {
            sstore(0x2, mul(a, b))
        }
    }

    function divAssembly(uint256 a, uint256 b) public {
        assembly {
            if iszero(b) { revert(0, 0) }
            sstore(0x3, div(a, b))
        }
    }
}
