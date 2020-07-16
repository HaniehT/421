package com.hanieh.nicolas.main;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Dice {

	private int face = 6;
	private int valueOfDice = 1;
	
	
	public Dice (int value) {
		this.valueOfDice = value;
	}

	public Dice() {
		super();
	}

	public int numberOfFaces() {
		return face;

	}

	public int getFace() {
		return face;
	}
	
	public int getValueDice () {
		return valueOfDice;
	}

	
	public int roll() {
		return  1 + (int)(Math.random() * 6);
	}
	

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Dice other = (Dice) obj;
		if (valueOfDice != other.valueOfDice)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Dice [face=" + face + ", valueOfDice=" + valueOfDice + "]";
	}

}
