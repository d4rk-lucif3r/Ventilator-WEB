import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class IndicatorWhite extends StatelessWidget {
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
  }) : super(key: key);

  final String firstText;
  final String? secondText;
  final String? subscriptText;
  final int numberText1;
  final int? numberText2;
  final String bottomFirstText;
  final String? bottomSecondText;
  final String? bottomSubscriptText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
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
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: firstText,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subscriptText != null
                              ? TextSpan(
                                  text: subscriptText,
                                  style: const TextStyle(
                                    fontSize: 9,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontFeatures: [FontFeature.subscripts()],
                                  ),
                                )
                              : const TextSpan(
                                  text: '',
                                  style: TextStyle(
                                    fontSize: 1,
                                    color: Colors.white,
                                  ),
                                ),
                          secondText != null
                              ? TextSpan(
                                  text: secondText,
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
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    numberText2 != null
                        ? AutoSizeText(
                            "${numberText1.toString()} : ${numberText2.toString()}",
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
                            numberText1.toString(),
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
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: bottomFirstText,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          bottomSubscriptText != null
                              ? TextSpan(
                                  text: bottomSubscriptText,
                                  style: const TextStyle(
                                    fontSize: 9,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFeatures: [FontFeature.subscripts()],
                                  ),
                                )
                              : const TextSpan(
                                  text: '',
                                  style: TextStyle(
                                    fontSize: 1,
                                    color: Colors.white,
                                  ),
                                ),
                          bottomSecondText != null
                              ? TextSpan(
                                  text: bottomSecondText,
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
  }
}
