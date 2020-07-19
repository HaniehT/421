package com.hanieh.nicolas.main;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class Game {

	private final int MAXTOKEN = 15;

	private int numberOfTokenDistribut =  MAXTOKEN;
	private int numberOfUsers;
	private List <Integer> listValueDiceKept =  new ArrayList<>();
	Player player1 = new Player("Player One");
	Player player2 = new Player("Player Deux");
	private int countPlay = 0;
	private Combinaison combinaisonPlayer1;
	private Combinaison combinaisonPlayer2;


	public Game () {

		this.numberOfTokenDistribut =  MAXTOKEN;	
	}

	public Game (Player player1, Player player2) {	
		this.numberOfTokenDistribut =  MAXTOKEN;	
		this.numberOfUsers = 2;
	}

	public Game (Player player1, Player player2, Player player3) {
		this.numberOfTokenDistribut =  MAXTOKEN;	
		this.numberOfUsers = 3;
	}

	public int tokenToDistribute () {
		return numberOfTokenDistribut;
	}

	public int numberOfusers() {
		return numberOfUsers;

	}

	private Combinaison playOneTurnPhaseOne () {

		//player rolle dice
		List<Integer> valueDices = new ArrayList<>();
		Dice dice = new Dice();


		for (int i=0; i < 3; i++) {
			valueDices.add(dice.roll());
		}
		return  new Combinaison(valueDices.get(0), valueDices.get(1), valueDices.get(2));
	}

	private Combinaison playOneTurnByValueDiceKnown (List<Integer> dicesKnown) {
		Dice dice = new Dice();

		if (dicesKnown.size() == 1) {
			return new Combinaison (dicesKnown.get(0),dice.roll(),dice.roll());
		}

		if (dicesKnown.size() == 2) {
			return new Combinaison (dicesKnown.get(0),dicesKnown.get(1),dice.roll());
		}

		if (dicesKnown.size() == 3) {
			return new Combinaison (dicesKnown.get(0),dicesKnown.get(1),dicesKnown.get(2));
		}

		return playOneTurnPhaseOne ();
	}

	public void launchTurnPhaseOne() {
		int numberToken = 0;

		//player1 rolls dice

		Combinaison combinaisonPlayer1 = playOneTurnPhaseOne();

		// Afficher les dices de player 1
		System.out.println("PLAYER 1 : \n");
		for ( Dice dice : combinaisonPlayer1.getDices() ) {
			System.out.println(dice);
		}

		// player2 roll dice

		Combinaison combinaisonPlayer2 = playOneTurnPhaseOne();

		// Afficher les dices de player 2
		System.out.println("PLAYER 2 : \n");
		for ( Dice dice : combinaisonPlayer2.getDices() ) {
			System.out.println(dice);
		}

		// which one has more combinations

		ComparateurCombinaison methodeCompare = new ComparateurCombinaison();


		if (methodeCompare.compare(combinaisonPlayer1.combinaisonToEnum(),CombinaisonNames.OTHERS) == 0 && combinaisonPlayer2.combinaisonToEnum() != CombinaisonNames.OTHERS ) {

			numberToken = combinaisonPlayer2.combinaisonToEnum().getValue();

			if (numberToken >  numberOfTokenDistribut ) {

				player1.setNumberOfToken(numberOfTokenDistribut);
				this.numberOfTokenDistribut = this.numberOfTokenDistribut - numberOfTokenDistribut;

			} else {

				player1.setNumberOfToken(numberToken);
				this.numberOfTokenDistribut = this.numberOfTokenDistribut - numberToken;

			}

			System.out.println("combinaison1 est others et combinaison2 est une combinason  = " + numberToken );


			System.out.println("numberOfTokenDistribut " + numberOfTokenDistribut);


		} 

		if (methodeCompare.compare(combinaisonPlayer2.combinaisonToEnum(),CombinaisonNames.OTHERS) == 0 && combinaisonPlayer1.combinaisonToEnum() !=  CombinaisonNames.OTHERS ) {

			numberToken = combinaisonPlayer1.combinaisonToEnum().getValue() ;

			if (numberToken >  numberOfTokenDistribut) {

				player2.setNumberOfToken(numberOfTokenDistribut);
				this.numberOfTokenDistribut = this.numberOfTokenDistribut - numberOfTokenDistribut;

			} else {

				player2.setNumberOfToken(numberToken);
				this.numberOfTokenDistribut = this.numberOfTokenDistribut - numberToken;

			}

			System.out.println("combinaison1 est une combinaison et combinaison2 est others  = " + numberToken );

			System.out.println("numberOfTokenDistribut " + numberOfTokenDistribut);


		}

		if (combinaisonPlayer1.combinaisonToEnum() !=  CombinaisonNames.OTHERS && combinaisonPlayer2.combinaisonToEnum() !=  CombinaisonNames.OTHERS) {

			if(methodeCompare.compare(combinaisonPlayer1.combinaisonToEnum(),combinaisonPlayer2.combinaisonToEnum()) == -1) {

				numberToken = combinaisonPlayer1.combinaisonToEnum().getValue() + combinaisonPlayer2.combinaisonToEnum().getValue();

				if (numberToken >  numberOfTokenDistribut) {

					player1.setNumberOfToken(numberOfTokenDistribut);
					this.numberOfTokenDistribut = this.numberOfTokenDistribut - numberOfTokenDistribut;

				} else {


					player1.setNumberOfToken(numberToken);
					this.numberOfTokenDistribut = this.numberOfTokenDistribut - numberToken;

				}


				System.out.println("combinaison2 est plus grand = " + numberToken );

				System.out.println("numberOfTokenDistribut " + numberOfTokenDistribut);

			} 

			if(methodeCompare.compare(combinaisonPlayer1.combinaisonToEnum(),combinaisonPlayer2.combinaisonToEnum()) == 1) {

				numberToken = combinaisonPlayer1.combinaisonToEnum().getValue() + combinaisonPlayer2.combinaisonToEnum().getValue();

				if (numberToken >  numberOfTokenDistribut) {

					player2.setNumberOfToken(numberOfTokenDistribut);
					this.numberOfTokenDistribut = this.numberOfTokenDistribut - numberOfTokenDistribut;

				} else {

					player2.setNumberOfToken(numberToken);
					this.numberOfTokenDistribut = this.numberOfTokenDistribut - numberToken;

				}


				System.out.println("combinaison1 est plus grand = " + numberToken );
				this.numberOfTokenDistribut --;
				System.out.println("numberOfTokenDistribut " + numberOfTokenDistribut);

			} 

		}
		/*

		if(methodeCompare.compare(combinaisonPlayer1.combinaisonToEnum(),combinaisonPlayer2.combinaisonToEnum()) == 0 ) {

			numberToken = combinaisonPlayer1.combinaisonToEnum().getValue() + combinaisonPlayer2.combinaisonToEnum().getValue();
			player1.setNumberOfToken(numberToken);
			System.out.println("combinaison1 et 2  est sont egaux = " + numberToken );

		} 

		 */

		if (methodeCompare.compare(combinaisonPlayer1.combinaisonToEnum(),CombinaisonNames.OTHERS) == 0 && methodeCompare.compare(combinaisonPlayer2.combinaisonToEnum(),CombinaisonNames.OTHERS) == 0 ) {

			if (CombinaisonToStringAndSort(combinaisonPlayer1).compareTo(CombinaisonToStringAndSort(combinaisonPlayer2)) == 1 ) {

				numberToken = combinaisonPlayer1.combinaisonToEnum().getValue();

				if (numberToken >  numberOfTokenDistribut) {

					player2.setNumberOfToken(numberOfTokenDistribut);
					this.numberOfTokenDistribut = this.numberOfTokenDistribut - numberOfTokenDistribut;

				} else {

					player2.setNumberOfToken(numberToken);
					this.numberOfTokenDistribut = this.numberOfTokenDistribut - numberToken;

				}

				System.out.println("combinaison1 est others et combinaison2 est others mais player1 est plus grand  = " + numberToken );
				this.numberOfTokenDistribut --;
				System.out.println("numberOfTokenDistribut " + numberOfTokenDistribut);


			} else {

				numberToken = combinaisonPlayer1.combinaisonToEnum().getValue();

				if (numberToken >  numberOfTokenDistribut) {

					player1.setNumberOfToken(numberOfTokenDistribut);

				} else {
					player1.setNumberOfToken(numberToken);

				}

				System.out.println("combinaison1 est others et combinaison2 est others mais player2 est plus grand  = " + numberToken );
				this.numberOfTokenDistribut --;
				System.out.println("numberOfTokenDistribut " + numberOfTokenDistribut);

			}
		}

		System.out.println(numberToken);
		System.out.println("Nomre de Token player1 = " + player1.getNumberOfToken());
		System.out.println("Nomre de Token player2 = " + player2.getNumberOfToken());
	}


	public String CombinaisonToStringAndSort (Combinaison combinaison) {

		String combinaisonEnString = "";

		for (int i = 0; i < 3 ; i++) {

			combinaisonEnString += combinaisonEnString + combinaison.getDices();		
		}

		char tempArray[] = combinaisonEnString.toCharArray(); 

		// sort tempArray 
		Arrays.sort(tempArray); 

		return new String(tempArray);
	}

	public boolean endOfPhaseOne () {
		return this.numberOfTokenDistribut == 0;

	}

	public boolean replay () {
		return true;
	}

	public void keepDice (int valueDiceKept) {

		listValueDiceKept.add(valueDiceKept);		
	}

	public List <Combinaison>  rollPhase2Player1 () {

	
		List <Combinaison> listCombinasonsTwoPlayers = new ArrayList<>();

		combinaisonPlayer1 = playOneTurnByValueDiceKnown(listValueDiceKept);
		countPlay ++;

		listValueDiceKept.clear();
		if (countPlay == 3) {
			
			combinaisonPlayer2 = rollPhase2Player2 (countPlay);

		}
		listCombinasonsTwoPlayers.add(combinaisonPlayer1);
		listCombinasonsTwoPlayers.add(combinaisonPlayer2);
		
		return listCombinasonsTwoPlayers ;
	}

	public Combinaison rollPhase2Player2 (int numberTimesOfRollDice) {

		

		for (int i=0; i < numberTimesOfRollDice; i++) {	
			combinaisonPlayer2 = playOneTurnByValueDiceKnown(listValueDiceKept);
		}
		
		return combinaisonPlayer2;
	}

	


}
