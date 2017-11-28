pragma solidity ^0.4.18;

import './SystemProviderFeature.sol';

contract User is SystemProviderFeature {

  address public owner;

  uint public pefromerScore;

  uint public employerScore;  

  function setOwner(address newOwner) public onlySystem {
    owner = newOwner;
  }

}
