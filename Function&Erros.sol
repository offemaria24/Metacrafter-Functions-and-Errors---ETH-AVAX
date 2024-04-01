// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.3 <0.9.0;

contract FunctionsAndError {

    uint PersonalBalance;
    address PersonallyOwned;

    constructor(){
        PersonallyOwned = msg.sender;
    }

    modifier UniqueOwner {
        require(PersonallyOwned == msg.sender, "Only the owner can access"); _;
       
    }

    function setUniqueBalance(uint _balance) public UniqueOwner {
        PersonalBalance = _balance;
    }
    
    function checkUniqueInput() public view UniqueOwner {
        assert(PersonalBalance > 0);
    }

    function getUnique() public view UniqueOwner returns (uint) {
        if (PersonalBalance <= 0) {
            revert("Balance should not be 0 or less than");
        } else {
            return PersonalBalance;
        }
    }
}
