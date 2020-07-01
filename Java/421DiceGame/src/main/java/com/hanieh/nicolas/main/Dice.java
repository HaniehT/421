package com.hanieh.nicolas.main;

public class Dice {

	private int face = 6;


	public int numberOfFaces() {
		return face;

	}

	public int getFace() {
		return face;
	}

	public void setFace(int face) {
		this.face = face;
	}

	public int roll() {
		return 1 + (int)(Math.random() * 6);

	}

	@Override
	public String toString() {
		return "Dice [face=" + face+  "]";
	}

}
