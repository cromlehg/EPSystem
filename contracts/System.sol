pragma solidity ^0.4.18;

import './User.sol';
import './EmployerContract.sol';

contract System {

  mapping(address => User) public users;

  EmployerContract[] public contracts;

  mapping (address => uint) public contractIndexes;

  modifier forRegisteredUser() {
    require(address(users[msg.sender]) != address(0x0));
    _;
  }

  function createUser() public {
    require(address(users[msg.sender]) == address(0x0));
    User memory newUser = new User();
    newUser.setOwner(msg.sender);
    users[msg.sender] = newUser;
  }

  function createEmployerContract(string link) public forRegisteredUser {
    User storage user = users[msg.sender];
    EmployerContract storage newContract = new EmployerContract();
    newContract.setOwner(msg.sender);
    contracts.push(newContract);
    contractIndexes[newContract] = activeContracts.length - 1;
  }

}
