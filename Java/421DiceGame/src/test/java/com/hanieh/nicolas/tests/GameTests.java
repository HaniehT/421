package com.hanieh.nicolas.tests;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class GameTests {

	
	@Test
	public void diceHasSixFaces() {
		Dice dice = new Dice();
		assertEquals(6, dice.numberOfFaces());
	}
	
	
}
