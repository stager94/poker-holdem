<p>Hold’em Poker</p>

<p>Task(complexity grows from min to max through the list): <br>
написать структуру классов и методов без реализации(спроектировать программу) <br>
написать программу в псевдокоде <br>
написать реальный код <br>
написать тесты(TDD) <br>
Flow <br>
It’s necessary to implement Hold‘em poker simulator. One game round consists of following steps: <br>
initialize deck <br>
deal 2 cards to each player (pre-flop) <br>
put 3 cards on the table (flop) <br>
put 1 more card on the table (turn) <br>
put 1 more card on the table (river) <br>
determine winner <br>
Each player constructs 5-card combination (hand) using 2 cards in his (her) hand and 5 cards on the table. Player who has best 5-card combination wins. <br>
Deck <br>
Standard 52 cards deck. <br>
Card faces: 2 3 4 5 6 7 8 9 T J Q K A <br>
Card suits: H S C D <br>
Cards:    2H - two of hearts <br>
    KD - jack of diamonds <br>
    QC - queen of clubs <br>
Hand types <br>
From lowest to highest: <br>
High card    2H 3C 6D 9S JS <br>
One pair    2H 3C 6D JD JS <br>
Two pair    2H 3C 3D JD JS <br>
Three of a kind    2H 7D JC JD JS <br>
Straight    2H 3D 4C 5S 6D <br>
Flush    2H 5H 9H JH AH <br>
Full house    7H 7D JC JD JS <br>
Four of a kind    7H JH JC JD JS <br>
Straight flush    9H TH JH QH KH <br>
Additional comparisons <br>
High    2H 3C 6D 9S JS    &gt;    2H 3C 6D 7S JS <br>
Pair    2H 3C 6D JD JS    &gt;    2H 3C 5D JD JS <br>
Two pair    2H 3C 3D JD JS    &gt;    2H 9C 9D TD TS <br>
    3H 9C 9D TD TS    &gt;    2H 9C 9D TD TS <br>
Three of a kind    3H 7D JC JD JS    &gt;    2H 7D JC JD JS <br>
Straight    2H 3D 4C 5S 6D    &gt;    AC 2H 3D 4C 5S <br>
    (AC 2H 3D 4C 5S is also Straight) <br>
Flush    2H 5H 9H JH AH    &gt;    2H 5H 9H TH AH <br>
Full house    7H 7D JC JD JS    &gt;    JH JD 7C 7D 7S <br>
Four of a kind    7H JH JC JD JS    &gt;    6H JH JC JD JS <br>
Straight flush    9H TH JH QH KH    &gt;    8H 9H TH JH QH <br>
    (AS 2S 3S 4S 5S is also Straight flush) <br>
Comparison method <br>
Input:    two 5-card “hands” <br>
Output:    1 - first hand is better <br>
    0 - hands are equal <br>
    -1 - second hand is better <br>
Simulation output example <br>
— Round 0 — <br>
Player A hand:    AD KD <br>
Player B hand:    AC TD <br>
Player C hand:    QD QC</p>

<p>Table on flop:    2D 5C 7D <br>
Table on turn:    2D 5C 7D QH <br>
Table on river:    2D 5C 7D QH 4D</p>

<p>Player A win:    2D 4D 7D KD AD (flush)</p>
