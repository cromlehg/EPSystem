pragma solidity ^0.4.18;

import './User.sol';

contract System {

  mapping(address => User) public users;

  modifier forRegisteredUser() {
    require(users[msg.sender].address != address(0x0));
    _;
  }

  function createUser() public {
    require(users[msg.sender].address == address(0x0));
    User memory user = new User();
    user.setOwner(msg.sender);
    users[msg.sender] = user;
  }

  function createEmployerContract(string link) public forRegisteredUser {
    User storage user = users[msg.sender];
  }

}
