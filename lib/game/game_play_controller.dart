import 'dart:math';

class GamePlayController {
  static int score = 0;

  static List<String> choices = ['Rock', 'Paper', 'Scissors'];
  String? randomChoices() {
    Random random = Random();
    int robotChoicesIndex = random.nextInt(3);
    return choices[robotChoicesIndex];
  }
}

class Choices {
  String? type = "";
  static var gameRules = {
    "Rock": {
      "Rock": "Tie",
      "Paper": "You Lose!",
      "Scissors": "You Won!",
    },
    "Paper": {
      "Rock": "You Won!",
      "Paper": "Tie",
      "Scissors": "You Lose!",
    },
    "Scissors": {
      "Rock": "You Lose!",
      "Paper": "You Won!",
      "Scissors": "Tie",
    },
  };

  Choices(this.type);
}
