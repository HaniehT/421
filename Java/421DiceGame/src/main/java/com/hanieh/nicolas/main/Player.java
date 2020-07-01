package com.hanieh.nicolas.main;

public class Player {
	
	private String name;
	private int numberTokens = 0;

	
	public Player (String nomPlayer) {
		this.name = nomPlayer;
	}
	

	
	public String getName() {
		return name;
	}
	
	public int getNumberOfToken() {
		return numberTokens;
	}
	
	@Override
	public String toString() {
		return "Player [name=" + name + ", numberTokens=" + numberTokens + "]";
	}


}
