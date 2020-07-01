package com.hanieh.nicolas.main;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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

	public List<Integer> Play () {

		List<Dice> listDices = new ArrayList<>();
		List<Integer> listDicesRolled = new ArrayList<>();
		for (int i=0; i<3 ; i++) {
			listDices.add(new Dice());	
		}

		listDicesRolled = listDices.stream().map(i -> i.roll()).collect( Collectors.toList());

		return listDicesRolled;

	}





}
