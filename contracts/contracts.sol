pragma solidity ^ 0.4 .18;

contract Migrations {

	address public owner;

	uint public last_completed_migration;

	modifier restricted() {
		if (msg.sender == owner) _;
	}

	function Migrations() public {
		owner = msg.sender;
	}

	function setCompleted(uint completed) public restricted {
		last_completed_migration = completed;
	}

	function upgrade(address new_address) public restricted {
		Migrations upgraded = Migrations(new_address);
		upgraded.setCompleted(last_completed_migration);
	}

}

contract SystemProviderFeature {

	System public system;

	function SystemProviderFeature() public {
		system = System(msg.sender);
	}

	modifier onlySystem() {
		require(msg.sender == address(system));
		_;
	}

}

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

contract System {

	mapping(address => User) public users;

	EmployerContract[] public contracts;

	mapping(address => uint) public contractIndexes;

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

contract Tribunal {

}

contract User is Ownable {

	uint public pefromerScore;

	uint public employerScore;

}

contract EmployerContract is Ownable {

	string public descr;

	enum ContractState {
		SearchingPerformer,
		PerformerStartsWorking,
		CancelByPerformer,
		FinishedSuccessful
	}

	ContractState public contractState;

	function setDescr(string newDescr) public onlySystem {
		descr = newDescr;
	}

}
