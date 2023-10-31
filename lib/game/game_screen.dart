// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rock_paper_scissors_game/game/game_play_screen.dart';

import 'game_play_controller.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 45;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 5.w),
                child: Row(
                  children: [
                    backButton(context),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                    buildHeader('Play Game', fontSize: 32.sp),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                      child: Text(
                        "Rock, Paper, Scissors: Please make your \n choice.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.all(10),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: Colors.black, width: 3.0),
                    //     borderRadius: BorderRadius.circular(10),
                    //   ),
                    //   child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         Text(
                    //           'SCORE',
                    //           style: TextStyle(
                    //               color: AppColors.primary_color,
                    //               fontSize: 20.sp,
                    //               fontWeight: FontWeight.w900,
                    //               fontFamily: 'Lato'),
                    //         ),
                    //         Text(
                    //           '${GamePlayController.score}',
                    //           style: TextStyle(
                    //               color: AppColors.primary_color,
                    //               fontSize: 20.sp,
                    //               fontWeight: FontWeight.w900,
                    //               fontFamily: 'Lato'),
                    //         )
                    //       ]),
                    // ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      height: 370.h,
                      child: Center(
                        child: Stack(children: [
                          Positioned(
                              top: 0,
                              left: MediaQuery.of(context).size.width / 2 -
                                  btnWidth / 2 -
                                  20,
                              child: Hero(
                                tag: "Rock",
                                child: gamePlayButton(() {
                                  // print('You choosed Rock');
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GamePlayScreen(
                                              gameChoice: Choices("Rock"))));
                                }, 'assets/images/rock_btn2.png', btnWidth),
                              )),
                          Positioned(
                              top: btnWidth,
                              left: MediaQuery.of(context).size.width / 2 -
                                  btnWidth -
                                  40,
                              child: Hero(
                                tag: 'Paper',
                                child: gamePlayButton(() {
                                  // print('You choosed paper');
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GamePlayScreen(
                                              gameChoice: Choices("Paper"))));
                                }, 'assets/images/paper_btn2.png', btnWidth),
                              )),
                          Positioned(
                              top: btnWidth,
                              right: MediaQuery.of(context).size.width / 2 -
                                  btnWidth -
                                  40,
                              child: Hero(
                                tag: 'Scissors',
                                child: gamePlayButton(() {
                                  // print('You choosed Scissor');
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GamePlayScreen(
                                              gameChoice:
                                                  Choices("Scissors"))));
                                }, 'assets/images/scisor_btn2.png', btnWidth),
                              )),
                        ]),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RawMaterialButton(
                        splashColor: Colors.blue,
                        fillColor: Colors.black,
                        onPressed: () {
                          showGeneralDialog(
                            barrierLabel: 'Alert',
                            barrierDismissible: true,
                            context: context,
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return Dialog(
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: IntrinsicHeight(
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Game Rules',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: 'Lato',
                                          ),
                                        ),
                                        const Divider(
                                          color: Colors.black,
                                        ),
                                        Text(
                                          "In the Rock, Paper, Scissors game, your objective is to defeat your opponent by selecting one of three moves: Rock, Paper, or Scissors. \nRock beats Scissors, Scissors beat Paper, and Paper beats Rock. If both players choose the same move, it's a tie. The player with the move that beats the opponent's move wins. Keep playing to determine the overall winner and have fun!",
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 17.sp,
                                            fontWeight: FontWeight.w900,
                                            fontFamily: 'Lato',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        padding: const EdgeInsets.all(16),
                        shape: const StadiumBorder(
                          side: BorderSide(
                            color: Colors.red,
                            width: 0.0,
                          ),
                        ),
                        child: Text(
                          'Game Rules',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Lato'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget gamePlayButton(Function()? ontap, String imagePath, double width) {
  return GestureDetector(
    onTap: ontap,
    child: Image.asset(
      imagePath,
      width: width,
    ),
  );
}

Widget backButton(BuildContext context) {
  return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Align(
          alignment: Alignment.topLeft,
          child: Image.asset(
            'assets/icons/arrow-left-circle.png',
            height: 45.h,
            width: 45.h,
          )));
}

Widget buildHeader(String text, {double fontSize = 24}) {
  return Center(
    child: Text(text,
        style: TextStyle(
            color: Colors.black,
            fontSize: fontSize.sp,
            fontWeight: FontWeight.w700,
            fontFamily: 'Lato'),
        textAlign: TextAlign.center),
  );
}
