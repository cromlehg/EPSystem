pragma solidity ^0.4.18;

import './Ownable.sol';

contract EmployerContract is Ownable {

  string public descr;

  enum ContractState {
    SearchingPerformer,
    PerformerStartsWorking,
    CancelByPerformer,
    FinishedSuccessful
  }

  ContractState public contractState;

  function setDescr(string newDescr) onlySystem {
    descr = newDescr;
  }

}

