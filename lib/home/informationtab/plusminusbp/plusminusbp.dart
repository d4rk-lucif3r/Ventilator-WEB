// ignore_for_file: invalid_required_named_param

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/plusminusprovider.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';

import 'bpcart.dart';

class PlusMinusBP extends StatelessWidget {
  const PlusMinusBP({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    // debugPrint("$h");

    return DefaultTextStyle(
      style: const TextStyle(
        inherit: false,
      ),
      child: Container(
        margin: const EdgeInsets.only(
          top: 5,
          right: 10,
          left: 20,
          bottom: 10,
        ),
        color: Colors.transparent,
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(10),
        //   boxShadow: const [
        //     BoxShadow(
        //       color: Colors.black45,
        //       blurRadius: 2,
        //       offset: Offset(4, 4),
        //     ),
        //     BoxShadow(
        //       color: Colors.black26,
        //       blurRadius: 1,
        //       offset: Offset(-1, -1),
        //     ),
        //   ],
        // ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  var ww = constraints.maxWidth;
                  return Container(
                    margin: const EdgeInsets.only(
                      bottom: 0,
                      right: 0,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: ww * .05,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 2,
                          offset: Offset(4, 4),
                        ),
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 1,
                          offset: Offset(-1, -1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const PusMinusCard(
                          firstText: 'VT',
                          valueText: 'vt',
                          subscriptText: '',
                        ),
                        SizedBox(
                          height: .7,
                          width: ww * .7,
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                        const PusMinusCard(
                          firstText: 'RR',
                          valueText: 'rr',
                          subscriptText: '',
                        ),
                        SizedBox(
                          height: .7,
                          width: ww * .7,
                          child: Container(
                            color: Colors.black,
                          ),
                        ),
                        const PusMinusCard(
                          firstText: 'FiO',
                          valueText: 'fio2',
                          subscriptText: '2',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: h / 60,
            ),
            Consumer<RealTimeClass>(builder: (context, provider, child) {
              return Expanded(
                flex: 2,
                child: Container(
                  // margin: const EdgeInsets.only(
                  //   top: 10,
                  // ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 5,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // color: const Color(0xff43CFBC),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        blurRadius: 2,
                        offset: Offset(4, 4),
                      ),
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 1,
                        offset: Offset(-1, -1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: BPCard(
                          firstText: 'BP',
                          valueText: ((int.parse(provider.sys) +
                                      int.parse(provider.dia)) /
                                  2)
                              .toString(),
                          constValue: 10,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                        child: Center(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 45),
                            height: .6,
                            width: double.infinity,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: BPCard(
                                firstText: 'SYS',
                                valueText: provider.sys,
                                constValue: 11,
                              ),
                            ),
                            SizedBox(
                              width: .6,
                              child: Container(
                                color: Colors.black,
                              ),
                            ),
                            Expanded(
                              child: BPCard(
                                firstText: 'DIA',
                                valueText: provider.dia,
                                constValue: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class PusMinusCard extends StatelessWidget {
  const PusMinusCard({
    Key? key,
    required this.firstText,
    required this.valueText,
    required this.subscriptText,
  }) : super(key: key);

  final String firstText;
  final String valueText;
  final String? subscriptText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<PlusMinusProvider>(
        builder: (context, provider, child) {
          return Container(
            color: Colors.transparent,
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: 5,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 2,
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: firstText,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subscriptText != null
                                  ? TextSpan(
                                      text: subscriptText,
                                      style: const TextStyle(
                                        fontSize: 7,
                                        color: Colors.black,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.all(0),
                            child: FloatingActionButton(
                              // foregroundColor: const Color(0xff7effee),
                              // backgroundColor: const Color(0xff43CFBC),
                              // 5ab2b1
                              // backgroundColor: const Color(0xff5ab2b1),
                              backgroundColor: const Color(0xff29abe2),

                              onPressed: () {
                                switch (valueText) {
                                  case "vt":
                                    provider.updateVT('decr');
                                    break;
                                  case 'rr':
                                    provider.updateRR('decr');
                                    break;
                                  default:
                                    provider.updateFIO2('decr');
                                }
                              },
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    '—',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(5),
                            child: AutoSizeText(
                              valueText == 'vt'
                                  ? provider.vt.toString()
                                  : valueText == 'rr'
                                      ? provider.rr.toString()
                                      : provider.fio2.toString(),
                              style: const TextStyle(
                                  color: Color(0xff29abe2),
                                  fontSize: 72,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Bahnschrift'),
                              minFontSize: 16,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(0),
                            child: FloatingActionButton(
                                // backgroundColor: const Color(0xff43CFBC),
                                // backgroundColor: const Color(0xff5ab2b1),
                                backgroundColor: const Color(0xff29abe2),
                                onPressed: () {
                                  switch (valueText) {
                                    case "vt":
                                      provider.updateVT('incr');
                                      break;
                                    case 'rr':
                                      provider.updateRR('incr');
                                      break;
                                    default:
                                      provider.updateFIO2('incr');
                                  }
                                },
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
