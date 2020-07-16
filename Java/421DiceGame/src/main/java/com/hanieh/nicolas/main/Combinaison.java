package com.hanieh.nicolas.main;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;


public class Combinaison {

	private List<Dice> combinaison = new ArrayList<>();
	private CombinaisonNames name;


	public Combinaison() {
		initializeCombinaison();

	}

	public Combinaison(List<Dice> combinaison) {
		this.combinaison = combinaison;	
		initializeCombinaison();

	}

	public Combinaison (int value1, int value2, int value3) {
		combinaison.add(new Dice(value1));
		combinaison.add(new Dice(value2));
		combinaison.add(new Dice(value3));
	}

	public List<Dice> initializeCombinaison() {

		for (int i=0; i<3; i++) {
			combinaison.add(new Dice());

		}	
		return combinaison;
	}


	public List<Dice> getDices() {
		return combinaison;
	}



	public int getNumberOfDice () {
		return combinaison.size();
	}

	public CombinaisonNames combinaisonToEnum () {
		String faces = "123456";
		String valuesOfDicesToString = "";
		
		List<Integer> valuesOfDices = combinaison.stream().map(i -> i.getValueDice()).collect(Collectors.toList());
		
		Collections.sort(valuesOfDices);
		
		for (Integer i : valuesOfDices) {
			
			valuesOfDicesToString = valuesOfDicesToString + "" + i;
			
		}
		
	
		

		if (combinaison.contains(new Dice(4)) &&  combinaison.contains(new Dice(2)) && combinaison.contains(new Dice(1))) {
			return CombinaisonNames.FOURHUNDREDTWENYONE;
		}

		if (combinaison.stream().filter(i -> i.getValueDice() == 1 ).count() == 3) {
			return CombinaisonNames.SIXAS;
		}

		if (combinaison.stream().filter(i -> i.getValueDice() == 1 ).count() == 2 && combinaison.contains(new Dice(6))) {
			return CombinaisonNames.SIXFICHE;
		}

		if (combinaison.stream().filter(i -> i.getValueDice() == 6 ).count() == 3) {
			return CombinaisonNames.BROLANSIX;
		}

		if (combinaison.stream().filter(i -> i.getValueDice() == 1 ).count() == 2 && combinaison.contains(new Dice(5))) {
			return CombinaisonNames.FIVEFICHE;
		}


		if (combinaison.stream().filter(i -> i.getValueDice() == 5 ).count() == 3) {
			return CombinaisonNames.BROLANFIVE;
		}


		if (combinaison.stream().filter(i -> i.getValueDice() == 1 ).count() == 2 && combinaison.contains(new Dice(4))) {
			return CombinaisonNames.FOURFICHE;
		}

		if (combinaison.stream().filter(i -> i.getValueDice() == 4 ).count() == 3) {
			return CombinaisonNames.BROLANFOUR;
		}

		if (combinaison.stream().filter(i -> i.getValueDice() == 1 ).count() == 2 && combinaison.contains(new Dice(3))) {
			return CombinaisonNames.THREEFICHE;
		}

		if (combinaison.stream().filter(i -> i.getValueDice() == 3 ).count() == 3) {
			return CombinaisonNames.BROLANTHREE;
		}

		if (combinaison.stream().filter(i -> i.getValueDice() == 1 ).count() == 2 && combinaison.contains(new Dice(2))) {
			return CombinaisonNames.TWOEFICHE;
		}

		if (combinaison.stream().filter(i -> i.getValueDice() == 2 ).count() == 3) {
			return CombinaisonNames.BROLANTWO;
		}

		if (combinaison.stream().filter(i -> i.getValueDice() == 2 ).count() == 2 && combinaison.contains(new Dice(1))) {
			return CombinaisonNames.NENET;
		}
		
		
       if (faces.contains(valuesOfDicesToString)) {
    	    return CombinaisonNames.SUITE;
    	   
       }

      return CombinaisonNames.OTHERS;
	}


}
