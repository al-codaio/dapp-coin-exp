pragma solidity ^0.4.4;

contract FernCoin {
	
	address public owner;
	mapping (address => uint) public regularBalance;
	mapping (address => FernCoinWallet) public balances;
	mapping (address => mapping(uint => uint)) public balancesMulti;

	struct FernCoinWallet {
		uint TreeCoin;
		uint LeafCoin;
	}

	function FernCoin() { //constructor
		owner = msg.sender;
		balances[owner].TreeCoin = 2000;
		balances[owner].LeafCoin = 8000;
	}

	function MultiCoin() {
		balancesMulti[msg.sender][0] = 9000;
		balancesMulti[msg.sender][1] = 8500;
		balancesMulti[msg.sender][2] = 8000;
		balancesMulti[msg.sender][3] = 7500;
		balancesMulti[msg.sender][4] = 7000;
	}

	function sendCoin(address _receiver, uint _amount, uint _coinindex) returns(bool _sufficient) { //for MultiCoin
		if (balancesMulti[msg.sender][_coinindex] < _amount) return false;
		balancesMulti[msg.sender][_coinindex] -= _amount;
		balancesMulti[_receiver][_coinindex] += _amount;
		return true;
	}

	function getBalance(address _user) constant returns(uint) {
		return (regularBalance[_user]);
	}

	function getBalanceFern(address _user) constant returns(uint, uint) {
		return (balances[_user].TreeCoin, balances[_user].LeafCoin);
	}

	function getBalanceMulti(address _user, uint _coinindex) constant returns(uint) {
		return (balancesMulti[_user][_coinindex]);
	}



}