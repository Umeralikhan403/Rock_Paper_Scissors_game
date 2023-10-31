import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rock_paper_scissors_game/game/game_screen.dart';
import 'game_play_controller.dart';

// ignore: must_be_immutable
class GamePlayScreen extends StatefulWidget {
  Choices gameChoice;
  GamePlayScreen({
    super.key,
    required this.gameChoice,
  });

  @override
  State<GamePlayScreen> createState() => _GamePlayScreenState();
}

class _GamePlayScreenState extends State<GamePlayScreen> {
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 50;

    ////////////// setting the path to Robot choice
    String? robotChoices = GamePlayController().randomChoices();
    String robotChoicePath = '';
    switch (robotChoices) {
      case "Rock":
        robotChoicePath = "assets/rock_btn2.png";
        break;

      case "Paper":
        robotChoicePath = "assets/paper_btn2.png";
        break;

      case "Scissors":
        robotChoicePath = "assets/scisor_btn2.png";
        break;

      default:
    }

    ///////////// setting the path to player choice
    String? playerChoice;
    switch (widget.gameChoice.type) {
      case "Rock":
        playerChoice = "assets/rock_btn2.png";
        break;

      case "Paper":
        playerChoice = "assets/paper_btn2.png";
        break;

      case "Scissors":
        playerChoice = "assets/scisor_btn2.png";
        break;

      default:
    }

    /////  Increment the score if You win
    if (Choices.gameRules[widget.gameChoice.type]![robotChoices] ==
        "You Won!") {
      setState(() {
        GamePlayController.score++;
      });
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30.h, left: 5.w),
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const GameScreen()));
                          },
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Image.asset(
                                'assets/arrow-left-circle.png',
                                height: 45.h,
                                width: 45.h,
                              ))),

                      SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                      // buildHeader('Game Play', fontSize: 32.sp),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.w),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 3.0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SCORE',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Lato'),
                              ),
                              Text(
                                '${GamePlayController.score}',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w900,
                                    fontFamily: 'Lato'),
                              )
                            ]),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 300.h,
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Hero(
                                    tag: "${widget.gameChoice.type}",
                                    child: gamePlayButton(
                                        () => null, playerChoice!, btnWidth)),
                                Text(
                                  'You',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Lato'),
                                )
                              ],
                            ),
                            Text(
                              'VS',
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w900,
                                  fontFamily: 'Lato'),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                gamePlayButton(
                                    () => null, robotChoicePath, btnWidth),
                                Text(
                                  'Opponent',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: 'Lato'),
                                )
                              ],
                            )
                          ],
                        )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 50.h),
                        child: Text(
                          "${Choices.gameRules[widget.gameChoice.type]![robotChoices]}",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Lato'),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: RawMaterialButton(
                          splashColor: Colors.blueGrey,
                          fillColor: Colors.black,
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const GameScreen()));
                          },
                          padding: const EdgeInsets.all(16),
                          shape: const StadiumBorder(
                            side: BorderSide(
                              color: Colors.blueGrey,
                              width: 0.0,
                            ),
                          ),
                          child: Text(
                            'Play Again',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Lato'),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
