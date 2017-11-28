pragma solidity ^0.4.18;

contract SystemProviderFeature {
 
  System public system;

  function SystemProviderFeature() public {
    system = System(msg.sender);
  }
 
  modifier onlySystem() {
    require(msg.sender == system);
    _;
  }

}
