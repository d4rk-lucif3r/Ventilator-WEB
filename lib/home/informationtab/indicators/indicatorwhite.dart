import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/alarmsync.dart';
import 'package:ventilator_ui/constants/constant.dart';

class IndicatorWhite extends StatefulWidget {
  const IndicatorWhite({
    Key? key,
    required this.firstText,
    this.secondText,
    this.subscriptText,
    required this.numberText1,
    required this.bottomFirstText,
    this.bottomSecondText,
    this.bottomSubscriptText,
    this.numberText2,
    required this.constValue,
  }) : super(key: key);

  final String firstText;
  final String? secondText;
  final String? subscriptText;
  final String? numberText1;
  final String? numberText2;
  final String bottomFirstText;
  final String? bottomSecondText;
  final String? bottomSubscriptText;
  final int constValue;

  @override
  State<IndicatorWhite> createState() => _IndicatorWhiteState();
}

class _IndicatorWhiteState extends State<IndicatorWhite> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Consumer<AlarmSync>(
        builder: (context, provider, child) {
          return GestureDetector(
            onTap: widget.constValue == 100
                ? () {}
                : () {
                    print(widget.constValue);
                    provider.updateAlarmWhich(widget.constValue);
                  },
            child: DefaultTextStyle(
              style: const TextStyle(
                inherit: false,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 2,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff3C3E95),
                  //6f68c7
                  //#3C3E95
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xff6f68c7),
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                    // BoxShadow(
                    //   color: Color(0xff6f68c7),
                    //   offset: Offset(-1, -1),
                    //   // spreadRadius: 3,
                    //   blurRadius: 3,
                    // ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.firstText,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                widget.subscriptText != null
                                    ? TextSpan(
                                        text: widget.subscriptText,
                                        style: const TextStyle(
                                          fontSize: 9,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontFeatures: [
                                            FontFeature.subscripts()
                                          ],
                                        ),
                                      )
                                    : const TextSpan(
                                        text: '',
                                        style: TextStyle(
                                          fontSize: 1,
                                          color: Colors.white,
                                        ),
                                      ),
                                widget.secondText != null
                                    ? TextSpan(
                                        text: widget.secondText,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    : const TextSpan(
                                        text: '',
                                        style: TextStyle(
                                          fontSize: 1,
                                          color: Colors.white,
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widget.numberText2 != null
                              ? AutoSizeText(
                                  "${widget.numberText1.toString()} : ${widget.numberText2.toString()}",
                                  style: const TextStyle(
                                      fontSize: 54,
                                      // color: Colors.red,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Bahnschrift'),
                                  minFontSize: 12,
                                  maxLines: 1,
                                )
                              : AutoSizeText(
                                  widget.numberText1.toString(),
                                  style: const TextStyle(
                                      fontSize: 54,
                                      // color: Colors.red,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Bahnschrift'),
                                  minFontSize: 12,
                                  maxLines: 1,
                                ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: widget.bottomFirstText,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                widget.bottomSubscriptText != null
                                    ? TextSpan(
                                        text: widget.bottomSubscriptText,
                                        style: const TextStyle(
                                          fontSize: 9,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontFeatures: [
                                            FontFeature.subscripts()
                                          ],
                                        ),
                                      )
                                    : const TextSpan(
                                        text: '',
                                        style: TextStyle(
                                          fontSize: 1,
                                          color: Colors.white,
                                        ),
                                      ),
                                widget.bottomSecondText != null
                                    ? TextSpan(
                                        text: widget.bottomSecondText,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    : const TextSpan(
                                        text: '',
                                        style: TextStyle(
                                          fontSize: 1,
                                          color: Colors.white,
                                        ),
                                      ),
                              ],
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
        },
      ),
    );
  }
}
