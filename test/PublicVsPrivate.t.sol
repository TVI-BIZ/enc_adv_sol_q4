// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import "forge-std/Test.sol";
import "../src/PublicVsPrivate.sol";

contract VariableGasOptimizationTest is Test {
    PublicVariable private publicVariable;
    PrivateVariable private privateVariable;

    function setUp() public {
        publicVariable = new PublicVariable(42);
        privateVariable = new PrivateVariable(42);
    }

    function testDeploymentGasCosts() public {
        uint256 startGas = gasleft();
        new PublicVariable(42);
        uint256 publicDeploymentGas = startGas - gasleft();

        startGas = gasleft();
        new PrivateVariable(42);
        uint256 privateDeploymentGas = startGas - gasleft();

        console.log("PublicVariable deployment gas:", publicDeploymentGas);
        console.log("PrivateVariable deployment gas:", privateDeploymentGas);

        assertLt(privateDeploymentGas, publicDeploymentGas, "Private variable should be cheaper");
    }

    function testUpdateValueGasCosts() public {
        uint256 startGas = gasleft();
        publicVariable.updateValue(100);
        uint256 publicUpdateGas = startGas - gasleft();
        console.log("PublicVariable updateValue gas:", publicUpdateGas);

        startGas = gasleft();
        privateVariable.updateValue(100);
        uint256 privateUpdateGas = startGas - gasleft();
        console.log("PrivateVariable updateValue gas:", privateUpdateGas);
    }

    function testGetValueGasCosts() public {
        uint256 startGas = gasleft();
        publicVariable.value();
        uint256 publicGetterGas = startGas - gasleft();

        startGas = gasleft();
        privateVariable.getValue();
        uint256 privateGetterGas = startGas - gasleft();

        console.log("PublicVariable getter gas:", publicGetterGas);
        console.log("PrivateVariable getter gas:", privateGetterGas);

        assertLt(privateGetterGas, publicGetterGas, "Private getter should be cheaper");
    }
}
