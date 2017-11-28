pragma solidity ^0.4.18;

import './SystemProviderFeature.sol';

contract Ownable is SystemProviderFeature {

  address public owner;

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

  function setOwner(address newOwner) public onlySystem {
    owner = newOwner;
  }

}

