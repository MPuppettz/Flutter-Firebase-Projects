import 'dart:math';
import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key, required this.onGameEnd});

  final Function(bool isWinner) onGameEnd;

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 2;
  int totalScore = 0;
  int rollsCompleted = 0;
  int chancesLeft = 5;
  List<int> scores = List.filled(5, -1); // -1 indicates not rolled yet
  bool gameCompleted = false;
  bool isWinner = false;

  void resetGame() {
    setState(() {
      currentDiceRoll = 2;
      totalScore = 0;
      rollsCompleted = 0;
      chancesLeft = 5;
      scores = List.filled(5, -1);
      gameCompleted = false;
      isWinner = false;
    });
    widget.onGameEnd(false); // Reset background to original color
  }

  void rollDice() {
    if (chancesLeft > 0 && !gameCompleted) {
      setState(() {
        currentDiceRoll = randomizer.nextInt(6) + 1;
        totalScore += currentDiceRoll;
        scores[rollsCompleted] = currentDiceRoll;
        rollsCompleted++;
        chancesLeft--;

        // Check if the game is completed
        if (totalScore >= 20 || chancesLeft == 0) {
          gameCompleted = true;
          isWinner = totalScore >= 20;
          widget.onGameEnd(isWinner); // Notify parent about game end
        }
      });
    }
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Your score: $totalScore/20',
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(height: 20),
        LinearProgressIndicator(
          value: totalScore / 20,
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        const SizedBox(height: 20),
        // Labels for 1st, 2nd, 3rd, 4th, 5th
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text('1st', style: TextStyle(color: Colors.white, fontSize: 16)),
            Text('2nd', style: TextStyle(color: Colors.white, fontSize: 16)),
            Text('3rd', style: TextStyle(color: Colors.white, fontSize: 16)),
            Text('4th', style: TextStyle(color: Colors.white, fontSize: 16)),
            Text('5th', style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
        const SizedBox(height: 10),
        // Display dice roll numbers
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(5, (index) {
            return Text(
              scores[index] == -1 ? '--' : scores[index].toString(),
              style: const TextStyle(color: Colors.white, fontSize: 24),
            );
          }),
        ),
        const SizedBox(height: 20),
        Text(
          'Chance left: $chancesLeft',
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(height: 20),
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          width: 200,
        ),
        const SizedBox(height: 20),
        if (gameCompleted)
          Text(
            isWinner ? 'You win!' : 'You lose!',
            style: TextStyle(
              color: isWinner ? Colors.green : Colors.red,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: gameCompleted ? resetGame : rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: Text(gameCompleted ? 'Play Again' : 'Roll Dice'),
        ),
      ],
    );
  }
}
