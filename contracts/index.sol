//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./ERC2771Context.sol";

contract getSetMood is ERC2771Context {   

    address public owner; 

    constructor(address _trustedForwarder) ERC2771Context(_trustedForwarder){
        owner = _msgSender();
    }

    modifier onlyOwner() {
        require(_msgSender() == owner, "Not owner");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    function setTrustedForwarder(address _trustedForwarder) onlyOwner external {
        _setTrustedForwarder(_trustedForwarder);
    }

    string mood;

    function setMood(string memory _mood) external {
        mood = _mood;
    }

    function getMood() public view returns(string memory) {
        return mood;
    }
}

