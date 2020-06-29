# 421 Dice game - Double coding Swift / Java

421 is a dice game.

Testing project.

Mac: Swift
Windows: Java (SpringBoot) + React


## Description

421 is a dice game.
It uses three six-faces dices.
The number of player is  two, three.
We will use 15 tokens for point.

The game has 2 phases: charge and discharge.

### CHARGE
Each player play once.
The smaller hand take the number of token accumulated for all player.

At the end of this phase, if one player has all 15 token the game ends.

### DISCHARGE
Each Player has 3 rolls.
After the first roll, the player can decide to stop, or continue.
The last hand is the hand of the player for the round.

The other player will have to play the same number of roll.

Once all players have played, the bigger hand gives its tokens to the smaller hand.


### TIE HAND
In case of tie (both hands are identical), we play RAMPO

The player who just tie the hand, re-launch the dice only once.
Then the other player re-launch the dice only once.
The best hand is consider the winner.
ATT: In case of RAMPO, only 1 token is exchange.


### HANDS

From High to small
(hand -> Token)

4-2-1 -> 10
1-1-1 -> 7
1-1-6 -> 6
6-6-6 -> 6
1-1-5 -> 5
5-5-5 -> 5
1-1-4 -> 4
4-4-4 -> 4
1-1-3 -> 3
3-3-3 -> 3
1-1-2 -> 2
2-2-2 -> 2
4-5-6 -> 2
3-4-5 -> 2
2-3-4 -> 2
1-2-3 -> 2
2-2-1 -> 2
Other -> 1

For other hand, the biggest number wins.
Ex: 
5-5-2 > 5-4-2
6-2-1 > 5-2-2
3-3-2 > 3-3-1

The dice are always order from the higher number to the small number


# EXAMPLE

2 Players
We’ll play with 5 tokens.

### Charge
P1: 2-1-1 / P2: 5-5-1 -> P2 takes 2 tokens
P1: 6-4-3 / P2: 5-4-1 -> P2 takes 1 token
P1: 6-2-1 / P2:6-2-1 -> RAMPO -> P2: 6-4-2 / P1: 6-3-2 -> P1 1 takes 1 token
P1: 6-4-2 / P2: 1-1-3 -> P1 takes 1 token (It should have been 3 tokens, but there is only 1 left)

At the end of CHARGE:
P1 has 2 tokens
P2 has 3 tokens

### Discharge
P1: 5-4-1 -> Chose to the replay the 5
P1: 6-4-1 -> Chose to replay the 6
P1: 4-4-1 -> End of turn

P2: 1-1-1 -> Chose to replay one 1
P2: 4-1-1 -> Chose to replay the 4
P2: 4-1-1 -> End of turn

P2: 1-1-4 > P1: 4-4-1 => P2 gives 4 tokens to P1.

P1 has all 5 tokens. P2 wins the game
