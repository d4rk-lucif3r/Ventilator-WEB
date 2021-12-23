import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/alarmsync.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';
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
    required this.maxValue,
    required this.minValue,
    required this.isAlarmActive,
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
  final int maxValue;
  final int minValue;
  final bool isAlarmActive;

  @override
  State<IndicatorWhite> createState() => _IndicatorWhiteState();
}

class _IndicatorWhiteState extends State<IndicatorWhite>
    with SingleTickerProviderStateMixin {
  late Color _containerColor;
  late Color _fontColor;
  late Animation _animation;
  late Animation _fontAnimation;
  late AnimationController _controller;
  bool _isAlarmRunning = false;

  void _triggerAlarm(bool value) {
    switch (value) {
      case true:
        if (_isAlarmRunning == false) {
          _controller.forward();
          _isAlarmRunning = true;
        } else {
          debugPrint("Alarm is running");
        }
        break;
      case false:
        _isAlarmRunning = false;
        _controller.stop();
        _containerColor = Colors.white;
        _fontColor = Colors.red;
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _containerColor = Colors.white;
    _fontColor = Colors.red;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _animation = ColorTween(
      begin: Colors.white,
      end: Colors.red,
    ).animate(_controller)
      ..addListener(() {
        // debugPrint("Animation");
        setState(() {
          _containerColor = _animation.value;
        });
      })
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _controller.reverse();

            // debugPrint("ANimation Completed");
          } else if (status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        },
      );
    _fontAnimation = ColorTween(
      begin: Colors.red,
      end: Colors.white,
    ).animate(_controller)
      ..addListener(() {
        // debugPrint("Animation");
        setState(() {
          _fontColor = _fontAnimation.value;
        });
      });
    // _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    _triggerAlarm(widget.isAlarmActive);
    return Expanded(
      flex: 1,
      child: Consumer2<AlarmSync, RealTimeClass>(
        builder: (context, provideral, providerrt, child) {
          // if (widget.numberText1! < widget.minValue ||
          //     widget.numberText1! > widget.maxValue) {}

          return

              // GestureDetector(
              //   onTap: widget.constValue == 100
              //       ? () {}
              //       : () {
              //           print(widget.constValue);
              //           provideral.updateAlarmWhich(widget.constValue);
              //         },
              //   child:

              DefaultTextStyle(
            style: const TextStyle(
              inherit: false,
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 2,
              ),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 10,
                bottom: 5,
              ),
              decoration: BoxDecoration(
                // color: const Color(0xff3C3E95),
                color: _containerColor,
                //6f68c7
                //#3C3E95
                // color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    // color: Color(0xff6f68c7),
                    color: Colors.black54,
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
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: widget.firstText,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              widget.subscriptText != null
                                  ? TextSpan(
                                      text: widget.subscriptText,
                                      style: const TextStyle(
                                        fontSize: 8,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontFeatures: [
                                          FontFeature.subscripts()
                                        ],
                                      ),
                                    )
                                  : const TextSpan(
                                      text: '',
                                      style: TextStyle(
                                        fontSize: 1,
                                        color: Colors.black,
                                      ),
                                    ),
                              widget.secondText != null
                                  ? TextSpan(
                                      text: widget.secondText,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    )
                                  : const TextSpan(
                                      text: '',
                                      style: TextStyle(
                                        fontSize: 1,
                                        color: Colors.black,
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: widget.bottomFirstText,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              widget.bottomSubscriptText != null
                                  ? TextSpan(
                                      text: widget.bottomSubscriptText,
                                      style: const TextStyle(
                                        fontSize: 8,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontFeatures: [
                                          FontFeature.subscripts()
                                        ],
                                      ),
                                    )
                                  : const TextSpan(
                                      text: '',
                                      style: TextStyle(
                                        fontSize: 1,
                                        color: Colors.black,
                                      ),
                                    ),
                              widget.bottomSecondText != null
                                  ? TextSpan(
                                      text: widget.bottomSecondText,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    )
                                  : const TextSpan(
                                      text: '',
                                      style: TextStyle(
                                        fontSize: 1,
                                        color: Colors.black,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        widget.numberText2 != null
                            ? AutoSizeText(
                                "${widget.numberText1.toString()} : ${widget.numberText2.toString()}",
                                style: TextStyle(
                                    fontSize: 58,
                                    color: _fontColor,
                                    // color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Bahnschrift'),
                                minFontSize: 24,
                                maxLines: 1,
                              )
                            : AutoSizeText(
                                widget.numberText1.toString(),
                                style: TextStyle(
                                  fontSize: 58,
                                  color: _fontColor,
                                  // color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Bahnschrift',
                                ),
                                minFontSize: 16,
                                maxLines: 1,
                              ),
                      ],
                    ),
                  ),
                  // Expanded(
                  //   flex: 2,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [

                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            // ),
          );
        },
      ),
    );
  }
}
