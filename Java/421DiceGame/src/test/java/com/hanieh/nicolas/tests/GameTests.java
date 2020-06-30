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
		Player Hanieh = new Player("Hanieh", 2);
		Player Nicolas = new Player("Nicolas", 4);
		
		assertEquals("Hanieh", Hanieh.getNomPlayer());
	}
	
	@Test
	public void numberTokenByPlayer() {
		
		Player Hanieh = new Player("Hanieh", 6);
		Player Nicolas = new Player("Nicolas", 8);
		
		assertEquals(6, Hanieh.getNumberOfToken());
		assertEquals(8, Nicolas.getNumberOfToken());
	}
	
	
}
