package com.hanieh.nicolas.main;

public class Player {
	
	private String name;
	private int numberTokens;
	
	public Player (String nomPlayer, int numberTokens) {
		this.name = nomPlayer;
		this.numberTokens = numberTokens;
	}
	
	public String getName() {
		return name;
	}
	
	public int getNumberOfToken() {
		return numberTokens;
	}

}
