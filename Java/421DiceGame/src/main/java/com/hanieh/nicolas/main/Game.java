package com.hanieh.nicolas.main;

public class Game {
	
	private final int MAXTOKEN = 15;
	
	private int numberOfTokenDistribut =  MAXTOKEN;
	private int numberOfUsers;
	
	
	

	public Game () {
		
		Player player1 = new Player("player1");
		Player player2 = new Player("player2");
		this.numberOfTokenDistribut =  MAXTOKEN;	
	}
	
	
	
	public Game (Player player1, Player player2) {	
		this.numberOfTokenDistribut =  MAXTOKEN;	
		this.numberOfUsers = 2;

	}
	
	public Game (Player player1, Player player2, Player player3) {
		this.numberOfTokenDistribut =  MAXTOKEN;	
		this.numberOfUsers = 3;
	}
	
	public int tokenToDistribute () {
		return numberOfTokenDistribut;
	}
	
	public int numberOfusers() {
		return numberOfUsers;
		
	}


}
