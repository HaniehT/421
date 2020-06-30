package com.hanieh.nicolas.tests;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import com.hanieh.nicolas.main.Dice;
import com.hanieh.nicolas.main.Player;

public class GameTests {
	
	@Test
	public void diceHasSixFaces() {
		Dice dice = new Dice();
		assertEquals(6, dice.numberOfFaces());
	}
	
	@Test
	public void nomPlayer() {
		Player hanieh = new Player("Hanieh");
		
		assertEquals("Hanieh", hanieh.getName());
	}
	
	@Test
	// Pas bon cela, car tu sais pas le nombre de token suivant le jeu
	/*
	public void numberTokenByPlayer() {
		
		Player Hanieh = new Player("Hanieh", 6);
		Player Nicolas = new Player("Nicolas", 8);
		
		assertEquals(6, Hanieh.getNumberOfToken());
		assertEquals(8, Nicolas.getNumberOfToken());
	}
	*/
	
	public void newPlayerShouldHaveZeroToken() {
		Player hanieh = new Player("Hanieh");
		assertEquals(0, hanieh.getToken());
	}
	
	// Puis prochain test - 
	//The number of player is two, three. We will use 15 tokens for point.
	
	public void newGameShouldStartWithFiftenTokenToDistribute() {
		Game game = new Game();
		assertEquals(15, game.tokenToDistribute());
	}
	
	public void newGameShouldhaveTwoorThreePlayer() {
		Game twoPlayerGame = new Game(new Player("Hanieh"), new Player("Nicolas"));
		assertEquals(2, game.numberOfusers());
		
		Game threePlayerGame = new Game(new Player("Hanieh"), new Player("Nicolas"), new Player("player3"));
		assertEquals(3, game.numberOfusers());
	}
	
	
	
}
