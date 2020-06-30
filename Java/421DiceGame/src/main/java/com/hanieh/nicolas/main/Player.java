package com.hanieh.nicolas.main;

public class Player {
	
	private String nomPlayer;
	private int numberTokens;
	
	public Player (String nomPlayer, int numberTokens) {
		this.nomPlayer = nomPlayer;
		this.numberTokens = numberTokens;
	}
	
	public String getNomPlayer() {
		return nomPlayer;
	}
	
	public int getNumberOfToken() {
		return numberTokens;
	}

}
