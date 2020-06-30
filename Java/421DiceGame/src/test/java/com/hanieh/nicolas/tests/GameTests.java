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
		Player Hanieh = new Player("Hanieh");
		Player Nicolas = new Player("Nicolas");
		
		assertEquals("Hanieh", Hanieh.getNomPlayer());
	}
	
	
}
