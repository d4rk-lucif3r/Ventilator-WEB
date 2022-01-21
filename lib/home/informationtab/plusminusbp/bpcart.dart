import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/alarmsync.dart';

class BPCard extends StatelessWidget {
  const BPCard({
    Key? key,
    required this.firstText,
    required this.valueText,
    required this.constValue,
    required this.fontColor,
  }) : super(key: key);

  final String firstText;
  final String valueText;
  final int constValue;
  final Color fontColor;

  //TODO: Functions in Gesture Detector
  //   onTap: constValue == 100
  // ? () {}
  // : () {
  //     debugPrint("$constValue");
  //     provider.updateAlarmWhich(constValue);
  //   },

  @override
  Widget build(BuildContext context) {
    return Consumer<AlarmSync>(
      builder: (context, provider, child) {
        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(1),
                      child: AutoSizeText(
                        firstText,
                        style: const TextStyle(
                          color: Colors.black,
                          // color: Color(0xff43CFBC),
                          fontSize: 36,
                          fontFamily: 'Bahnschrift',
                        ),
                        minFontSize: 12,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: AutoSizeText(
                      valueText,
                      style: TextStyle(
                        // color: Colors.black,
                        // color: Color(0xff43CFBC),
                        color: fontColor,
                        fontSize: 36,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Bahnschrift',
                      ),
                      minFontSize: 12,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
