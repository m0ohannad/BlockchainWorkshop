// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract WorkshopAttendance {

    mapping(address => string) attendees;
    address[] addresses;

    function registerAttendee(string memory name) public {
        require(block.timestamp <= 1696716000, "Registration closed.");
        attendees[msg.sender] = name;
        addresses.push(msg.sender);
    }
    
    function getNameByAddress(address useraddr) public view returns(string memory){
        return attendees[useraddr];
    }

    function getAllAttendees() public view returns(string[] memory, address[] memory) {
        string[] memory allAttendees = new string[](addresses.length);
        
        for (uint256 i = 0; i < addresses.length; i++) {
            allAttendees[i] = attendees[addresses[i]];
        }

        return (allAttendees, addresses);
    }
}
