import 'package:flutter/material.dart';
import 'dice_roller.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatefulWidget {
  const GradientContainer({super.key});

  @override
  State<GradientContainer> createState() {
    return _GradientContainerState();
  }
}

class _GradientContainerState extends State<GradientContainer> {
  Color color1 = Colors.deepPurple;
  Color color2 = Colors.indigo;

  void updateBackground(bool isWinner) {
    setState(() {
      if (isWinner) {
        color1 = Colors.green;
        color2 = Colors.lightGreen;
      } else if (!isWinner && color1 != Colors.deepPurple) {
        color1 = Colors.deepPurple;
        color2 = Colors.indigo;
      } else {
        color1 = Colors.red;
        color2 = Colors.deepOrange;
      }
    });
  }

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        child: DiceRoller(
          onGameEnd: updateBackground,
        ),
      ),
    );
  }
}
