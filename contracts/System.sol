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
    User newUser = new User();
    newUser.setOwner(msg.sender);
    users[msg.sender] = newUser;
  }

  function createEmployerContract(string link) public forRegisteredUser {
    EmployerContract newContract = new EmployerContract();
    newContract.setOwner(msg.sender);
    contracts.push(newContract);
    contractIndexes[newContract] = contracts.length - 1;
  }

}
