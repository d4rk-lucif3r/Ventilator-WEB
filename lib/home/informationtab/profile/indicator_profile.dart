import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/alarmsync.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'package:ventilator_ui/connect/tempprovider.dart';
import 'package:ventilator_ui/constants/constant.dart';

class IndicatorProfile extends StatefulWidget {
  IndicatorProfile({
    Key? key,
    required this.firstText,
    this.secondText,
    this.subscriptText,
    this.minValue = 0,
    this.maxValue = 0,
    required this.identifier,
  }) : super(key: key);

  int minValue;
  int maxValue;
  final String firstText;
  final String? secondText;
  final String? subscriptText;
  final int identifier;

  void maxIncre() {
    maxValue++;
  }

  void maxDecre() {
    maxValue--;
  }

  void minIncre() {
    minValue++;
  }

  void minDecre() {
    minValue--;
  }

  @override
  State<IndicatorProfile> createState() => _IndicatorProfileState();
}

class _IndicatorProfileState extends State<IndicatorProfile> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Consumer<AlarmSync>(
          builder: (context, provider, child) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              decoration: const BoxDecoration(
                color: Colors.transparent,
                // borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AlarmText(
                    firstText: widget.firstText,
                    secondText: widget.secondText,
                    subscriptText: widget.subscriptText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Container(
                      color: Colors.black,
                      width: constraints.maxWidth * .4,
                      height: .7,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const AutoSizeText(
                    'MAX',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                    minFontSize: 12,
                    maxLines: 1,
                  ),
                  AspectRatio(
                    aspectRatio: 3.8,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.all(10),
                            child: FloatingActionButton(
                              // foregroundColor: const Color(0xff7effee),
                              // backgroundColor: const Color(0xff43CFBC),
                              // 5ab2b1
                              backgroundColor: const Color(0xff5ab2b1),
                              //TODO: Decrease MAX value
                              onPressed: () {
                                setState(() => widget.maxDecre());
                                debugPrint(widget.maxValue.toString());
                                // debugPrint("$max");
                              },
                              child: const Center(
                                child: AutoSizeText(
                                  '—',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 52,
                                  ),
                                  minFontSize: 12,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            child: AutoSizeText(
                              widget.maxValue.toString(),
                              style: const TextStyle(
                                  color: Color(0xff43CFBC),
                                  fontSize: 72,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Bahnschrift'),
                              minFontSize: 12,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(10),
                            child: FloatingActionButton(
                                // backgroundColor: const Color(0xff43CFBC),
                                backgroundColor: const Color(0xff5ab2b1),
                                //TODO: Increasing MAX value
                                onPressed: () {
                                  setState(() => widget.maxIncre());
                                  debugPrint(widget.maxValue.toString());
                                  // debugPrint("$max");
                                },
                                child: const Center(
                                  child: AutoSizeText(
                                    '+',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 52,
                                    ),
                                    minFontSize: 12,
                                    maxLines: 1,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    child: Container(
                      color: Colors.black,
                      width: constraints.maxWidth * .8,
                      height: .7,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const AutoSizeText(
                    'MIN',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    ),
                    minFontSize: 12,
                    maxLines: 1,
                  ),
                  AspectRatio(
                    aspectRatio: 3.8,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.all(10),
                            child: FloatingActionButton(
                              // foregroundColor: const Color(0xff7effee),
                              // backgroundColor: const Color(0xff43CFBC),
                              // 5ab2b1
                              backgroundColor: const Color(0xff5ab2b1),
                              //TODO: Increase MIN value
                              onPressed: () {
                                setState(() => widget.minIncre());
                                debugPrint(widget.minValue.toString());
                              },
                              child: const Center(
                                child: AutoSizeText(
                                  '—',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 52,
                                  ),
                                  minFontSize: 12,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            child: AutoSizeText(
                              widget.minValue.toString(),
                              style: const TextStyle(
                                  color: Color(0xff43CFBC),
                                  fontSize: 72,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Bahnschrift'),
                              minFontSize: 12,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(10),
                            child: FloatingActionButton(
                                // backgroundColor: const Color(0xff43CFBC),
                                backgroundColor: const Color(0xff5ab2b1),
                                //TODO: Decrease MIN value
                                onPressed: () {
                                  setState(() => widget.minDecre());
                                  debugPrint(widget.minValue.toString());
                                },
                                child: const Center(
                                  child: AutoSizeText(
                                    '+',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 52,
                                    ),
                                    minFontSize: 12,
                                    maxLines: 1,
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Container(
                      color: Colors.black,
                      width: constraints.maxWidth * .8,
                      height: .7,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  AspectRatio(
                    aspectRatio: 4.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 45,
                        vertical: 5,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          provider.updateAlarmWhich(0);
                        },
                        color: const Color(0xffd50000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: constraints.maxHeight * .5,
                          height: 40,
                          alignment: Alignment.center,
                          child: const Text(
                            'Discard',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AspectRatio(
                    aspectRatio: 4.5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 45,
                        vertical: 5,
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          // provider.localAlarmUpdate(
                          //     identifier, max, min);
                          // switch (widget.identifier) {
                          //   case 1:
                          //     tempprovider.setValue(
                          //         provider.prmax, provider.prmin);
                          //     break;
                          //   case 2:
                          //     tempprovider.setValue(
                          //         provider.spo2max, provider.spo2min);
                          //     break;
                          //   case 3:
                          //     tempprovider.setValue(
                          //         provider.pipmax, provider.pipmin);
                          //     break;
                          //   case 4:
                          //     tempprovider.setValue(
                          //         provider.peepmax, provider.peepmin);
                          //     break;
                          //   case 11:
                          //     tempprovider.setValue(
                          //         provider.sysmax, provider.sysmin);
                          //     break;
                          //   case 12:
                          //     tempprovider.setValue(
                          //         provider.diamax, provider.diamin);
                          //     break;
                          // }
                          provider.localAlarmUpdate(
                            widget.identifier,
                            widget.maxValue,
                            widget.minValue,
                          );
                          provider.updateAlarmWhich(0);
                        },
                        color: const Color(0xff4caf50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: constraints.maxHeight * .5,
                          height: 40,
                          alignment: Alignment.center,
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
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

class AlarmText extends StatelessWidget {
  const AlarmText({
    Key? key,
    required this.firstText,
    this.secondText,
    this.subscriptText,
  }) : super(key: key);

  final String firstText;
  final String? secondText;
  final String? subscriptText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: firstText,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          subscriptText != null
              ? TextSpan(
                  text: subscriptText,
                  style: const TextStyle(
                    fontSize: 9,
                    color: Colors.black,
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
                    color: Colors.black,
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
    );
  }
}
