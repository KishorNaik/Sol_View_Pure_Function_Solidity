// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract ViewAndPureFunctionCon{

    uint private storeData;

    // Setter
    function set(uint _storedData) public {
        storeData=_storedData;
    }

    // Getter
    //// In View function We can not modify the state variable but we can read the state variable
    function getView() public view returns(uint){
        return storeData;
    }

    //// In Pure Function we can not modify the state variable but also not able to read the state variable
    function getPure() public pure returns(uint){
         //Function declared as pure, but this expression (potentially) reads from the environment or state and thus requires "view".
        //return storeData;
        return 1;
    }


    // Pure And Function Accessibility

    // Non Pure and View Function
    function nonViewPureFunction() private{
        // body
        console.log("Non View and Pure Function");
    }

    // View Function Private
    function viewFunctionPrivate() private view{
        // body
        console.log("View Function");
    }

    // Pure Function Private
    function pureFunctionPrivate() private pure{
        // body
    }

    // View Function Public
    function viewFunction() public view {
        // Here you can't call the non view or pure functions.
        //nonViewPureFunction();

        // Here you can call the pure function
        pureFunctionPrivate();
        // but you can call only view function here.
        viewFunctionPrivate();
    }

    function pureFunction() public view{

        // Here you can't call the non view or pure functions.
        //nonViewPureFunction();

        // Here you can call the pure function
        pureFunctionPrivate();
        // but you can call only view function here.
        viewFunctionPrivate();
    }


}