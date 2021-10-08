import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';

import '../../constant.dart';
import 'indicatorwhite.dart';

class Indicators extends StatefulWidget {
  const Indicators({
    Key? key,
  }) : super(key: key);

  @override
  State<Indicators> createState() => _IndicatorsState();
}

class _IndicatorsState extends State<Indicators> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RealTimeClass>(builder: (context, provider, child) {
      return StreamBuilder(
        stream: provider.updateStreamedData(),
        builder: (context, snapshot) => Container(
          color: Colors.transparent,
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Row(
            children: [
              IndicatorWhite(
                firstText: 'PR',
                numberText1: provider.pr,
                bottomFirstText: '/m',
                constValue: 1,
              ),
              IndicatorWhite(
                firstText: 'SpO',
                subscriptText: '2',
                numberText1: provider.spo2,
                bottomFirstText: '%',
                constValue: 2,
              ),
              IndicatorWhite(
                firstText: 'PIP',
                numberText1: provider.pip,
                bottomFirstText: 'cmH',
                bottomSubscriptText: '2',
                bottomSecondText: 'O',
                constValue: 3,
              ),
              IndicatorWhite(
                  firstText: 'PEEP',
                  numberText1: provider.peep,
                  bottomFirstText: 'cmH',
                  bottomSubscriptText: '2',
                  bottomSecondText: 'O',
                  constValue: 4),
              IndicatorWhite(
                firstText: 'I:E',
                numberText1: provider.i_e.substring(0, 1),
                numberText2: provider.i_e.substring(2),
                bottomFirstText: '',
                constValue: 100,
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _ProfileState {}
