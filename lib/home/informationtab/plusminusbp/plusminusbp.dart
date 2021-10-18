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
    return DefaultTextStyle(
      style: const TextStyle(
        inherit: false,
      ),
      child: Container(
        margin: const EdgeInsets.only(
          top: 5,
          right: 15,
          left: 10,
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
              flex: 3,
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 2,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
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
              ),
            ),
            Consumer<RealTimeClass>(builder: (context, provider, child) {
              return Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
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
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 10,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
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
                  flex: 6,
                  child: Container(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.all(5),
                            child: FloatingActionButton(
                              // foregroundColor: const Color(0xff7effee),
                              // backgroundColor: const Color(0xff43CFBC),
                              // 5ab2b1
                              backgroundColor: const Color(0xff5ab2b1),

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
                              valueText == 'vt'
                                  ? provider.vt.toString()
                                  : valueText == 'rr'
                                      ? provider.rr.toString()
                                      : provider.fio2.toString(),
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
                            padding: const EdgeInsets.all(5),
                            child: FloatingActionButton(
                                // backgroundColor: const Color(0xff43CFBC),
                                backgroundColor: const Color(0xff5ab2b1),
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
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
