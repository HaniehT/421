package com.hanieh.nicolas.main;

public enum CombinaisonNames {
	FOURHUNDREDTWENYONE(10),
	SIXAS(7),
	SIXFICHE(6),
	BROLANSIX(6),
	FIVEFICHE(5),
	BROLANFIVE(5),
	FOURFICHE(4),
	BROLANFOUR(4),
	THREEFICHE(3),
	BROLANTHREE(3),
	TWOEFICHE(2),
	BROLANTWO(2),
	SUITE(2),
	NENET(2),
	OTHERS(1);
	
	private int value;
	
	public int getValue() {
		return value;
	}
	
	CombinaisonNames (int value) {
		this.value = value;
	}
	
	public static boolean contains(CombinaisonNames combinaisonNames) {

	    for (CombinaisonNames c : CombinaisonNames.values()) {
	        if (c.name().equals(combinaisonNames)) {
	            return true;
	        }
	    }

	    return false;
	}
}


