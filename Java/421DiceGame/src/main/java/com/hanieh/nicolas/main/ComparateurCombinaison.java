package com.hanieh.nicolas.main;

import java.util.Comparator;

public class ComparateurCombinaison implements Comparator<CombinaisonNames> {
	
	
	@Override
	public int compare(CombinaisonNames o1, CombinaisonNames o2) {
		if (o1 == o2) {
			return 0;
		}
		
		if (o1 == o1.FOURHUNDREDTWENYONE) {
			return 1;	
		}
		
		if (o2 == o2.FOURHUNDREDTWENYONE) {
			return -1;
		}
		
		if (o1 == o1.SIXAS) {
			return 1;	
		}
		
		if (o2 == o2.SIXAS) {
			return -1;
		}
		
		if (o1 == o1.SIXFICHE || o1 == o1.BROLANSIX) {
			return 1;	
		}
		
		if (o2 == o2.SIXFICHE || o2 == o2.BROLANSIX) {
			return -1;	
		}
		
		if (o1 == o1.FIVEFICHE || o1 == o1.BROLANFIVE) {
			return 1;	
		}
		
		if (o2 == o2.FIVEFICHE || o2 == o2.BROLANFIVE) {
			return -1;	
		}
		
		if (o1 == o1.FOURFICHE || o1 == o1.BROLANFOUR) {
			return 1;	
		}
		
		if (o2 == o2.FOURFICHE || o2 == o2.BROLANFOUR) {
			return -1;	
		}
		
		if (o1 == o1.THREEFICHE|| o1 == o1.BROLANTHREE) {
			return 1;	
		}
		
		if (o2 == o2.THREEFICHE || o2 == o2.BROLANTHREE) {
			return -1;	
		}
		
		if (o1 == o1.TWOEFICHE || o1 == o1.BROLANTWO || o1 == o1.SUITE ||  o1 == o1.NENET ) {
			return 1;	
		}
		
		if (o2 == o2.TWOEFICHE || o2 == o2.BROLANTWO || o2 == o2.SUITE ||  o2 == o2.NENET) {
			return -1;	
		}
		
		
		
		
		
		
		return 0;
	}}
