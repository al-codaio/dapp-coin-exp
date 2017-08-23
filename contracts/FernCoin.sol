pragma solidity ^0.4.4;

contract FernCoin {
	
	mapping (address => FernCoinWallet) balances;

	struct FernCoinWallet {
		uint TreeCoin;
		uint LeafCoin;
	}

	function FernCoin() { //initializer
		balances[msg.sender].TreeCoin = 2000;
		balances[msg.sender].LeafCoin = 8000;
	}

	

	function getBalance(address _user) constant returns(uint, uint) {
		return (balances[_user].TreeCoin, balances[_user].LeafCoin);
	}



}