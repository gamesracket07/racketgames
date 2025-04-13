import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/appConstants.dart';
import 'ScoreBoardWidgetController.dart';

class ScoreBoardWidget extends StatelessWidget {
  final ScoreBoardWidgetController controller;

  ScoreBoardWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Widget
        Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  'Team A',
                  style: TextStyle(
                      fontSize: AppConstants.kTitleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),

                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => Directionality(
                    textDirection: controller.TeamAFlowDirection.value,
                    // Swap to Right-to-Left direction
                    child: Row(
                      children: [
                        Obx(
                          () => ChoiceChip(
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Abhishek',
                                    style: TextStyle(
                                      fontSize: 16, // Text size
                                      color: Colors.white, // Text color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            selected: controller.TeamASelectedPlayer.value == 1,
                            onSelected: (selected) {
                              controller.TeamASelectedPlayer.value = 1;
                              controller.update();
                            },
                            selectedColor: Colors.blue,
                            backgroundColor: Colors.grey[300],
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            controller.ChangeTeamADirection();
                          },
                          icon: Icon(
                            Icons.swap_horiz_sharp, // The icon to display
                            color: Colors.black, // Icon color
                            size: 40, // Icon size
                          ),
                        ),
                        const Spacer(),
                        Obx(
                          () => ChoiceChip(
                            label: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ashish S',
                                    style: TextStyle(
                                      fontSize: 16, // Text size
                                      color: Colors.white, // Text color
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            selected: controller.TeamASelectedPlayer.value == 2,
                            onSelected: (selected) {
                              controller.TeamASelectedPlayer.value = 2;
                              controller.update();
                            },
                            selectedColor: Colors.blue,
                            backgroundColor: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
        const SizedBox(
          height: 30,
        ),
        // Spacer to push the middle widget

        // Middle Widget

        Obx(
          () => CircularButton(
            text: '${controller.teamAScore.value}',
            //backcolor: Colors.green,
            onPressed: () {
              controller.IncreaseTeamAScore();
            },
          ),
        ),
        Spacer(),

        Obx(
          () =>
              CircularButton(
            text: '${controller.teamBScore.value}',
            backcolor: Colors.green,
            onPressed: () {
              controller.IncreaseTeamBScore();
            },
          ),
        ),

        const SizedBox(
          height: 30,
        ),

        // Spacer to push the bottom widget

        // Bottom Widget
        Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  'Team B',
                  style: TextStyle(
                      fontSize: AppConstants.kTitleFontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(() => Directionality(
                      textDirection: controller.TeamBFlowDirection.value,
                      // Swap to Right-to-Left direction
                      child: Row(
                        children: [
                          Obx(
                            () =>
                               Expanded(child:
                               ChoiceChip(
                              label: Padding(
                                padding: const EdgeInsets.all(8.0),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ashish ',
                                      style: TextStyle(
                                        fontSize: 16, // Text size
                                        color: Colors.white,
                                        // Text color
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              selected:
                                  controller.TeamASelectedPlayer.value == 1,
                              onSelected: (selected) {
                                controller.TeamASelectedPlayer.value = 1;
                                controller.update();
                              },
                              selectedColor: Colors.blue,
                              backgroundColor: Colors.grey[300],
                            ),
                                   flex: 1,),
                         ),
                     const   SizedBox(width: 5,),
                          IconButton(
                            onPressed: () {
                              controller.ChangeTeamBDirection();
                            },
                            icon: Icon(
                              Icons.swap_horiz_sharp, // The icon to display
                              color: Colors.black, // Icon color
                              size: 40, // Icon size
                            ),
                          ),
                          const   SizedBox(width: 5,),
                          Obx(
                            () =>Expanded(child:
                            ChoiceChip(
                              label:
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Abhishek',
                                      style: TextStyle(
                                        fontSize: 16, // Text size
                                        color: Colors.black, // Text color
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              selected:
                              controller.TeamASelectedPlayer.value == 2,
                              onSelected: (selected) {
                                controller.TeamASelectedPlayer.value = 2;
                                controller.update();
                              },
                              selectedColor: Colors.blue,
                              backgroundColor: Colors.grey[300],
                            ), flex:1)

                          ),

                          //   CustomChoiceChip())
                        ],
                      ),

                    )),

              ],
            )),
      ],
    );
  }
}

class CircularButton extends StatelessWidget {
  final String text;
  final Color backcolor;
  final dynamic onPressed;

  CircularButton(
      {required this.onPressed,
      required this.text,
      this.backcolor = Colors.blue
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(), // Makes the button circular
        padding: EdgeInsets.all(0), // Adjusts button size

        fixedSize: Size(100, 100), // Button color
      ),
      child: Text(
        this.text,
        style: TextStyle(
          fontSize: AppConstants.kHeaderFontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CustomChoiceChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This is a long text that\nspans multiple lines.',
              style: TextStyle(
                fontSize: 16, // Text size
                color: Colors.white, // Text color
              ),
            ),
          ],
        ),
      ),
      selected: false,
      onSelected: (bool selected) {
        // Handle selection
      },
      backgroundColor: Colors.blue,
      // Background color of the chip
      selectedColor: Colors.green,
      // Color when the chip is selected
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(8), // Padding around the text
    );
  }
}
