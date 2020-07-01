package com.hanieh.nicolas.tests;

import static org.junit.Assert.assertFalse;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import org.junit.jupiter.api.Test;

import com.hanieh.nicolas.main.Dice;
import com.hanieh.nicolas.main.Game;
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
	public void newPlayerShouldHaveZeroToken() {
		Player hanieh = new Player("Hanieh");
		assertEquals(0, hanieh.getNumberOfToken());
	}

	// Puis prochain test - 
	//The number of player is two, three. We will use 15 tokens for point.
	@Test
	public void newGameShouldStartWithFiftenTokenToDistribute() {
		Game game = new Game();
		assertEquals(15, game.tokenToDistribute());
	}

	@Test
	public void newGameShouldhaveTwoorThreePlayer() {
		Game twoPlayerGame = new Game(new Player("Hanieh"), new Player("Nicolas"));
		assertEquals(2, twoPlayerGame.numberOfusers());

		Game threePlayerGame = new Game(new Player("Hanieh"), new Player("Nicolas"), new Player("player3"));
		assertEquals(3, threePlayerGame.numberOfusers());
	}

	/*
	@Test
	public void LancerDice() {
		Game game = new Game();
		System.out.println(game.Play());
	
	}
	*/
	
	// Each time a player plays, we have a combination of 3 Dice
	// 1 -> A play should return a combination of 3 dice
	// 
	
	@Test
	public void aDiceShowsAFaceBetweenOneandSix() {
		Dice dice = new Dice();
		for (int i = 0; i < 1000; i++) {
			assert(dice.showFace() >= 1 && dice.showFace() <= 6);
		}	
	}
	
	@Test
	public void aCombinaisonHasThreeDices() {
		Combinaison combinaison = new Combinaison();
		assertEquals(3, combinaison.getNumberOfDice());
		assert(combinaison.getDices().get(0) instanceof Dice);
		assert(combinaison.getDices().get(1) instanceof Dice);
		assert(combinaison.getDices().get(3) instanceof Dice);
		assertFalse(combinaison.getName().isEmpty());
	}
	
	@Test
	public void combinaison421isThebiggest() {
		Combinaison ununun = Combinaison(1,1,1);
		Combinaison quatredeuxun = Combinaison(2,1,4);
		assertTrue(quatredeuxun > ununun);
	}
	
	
	@Test
	public void aPlayShouldReturnACombinaison() {
		Combinaison c = new Game().Play();
		assertNotEquals(null, c);
	}
	
	
}
