import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/alarmsync.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';

import '../../../constants/constant.dart';
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
    return Consumer2<RealTimeClass, AlarmSync>(
        builder: (context, provider, providerAlarm, child) {
      return Container(
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
              maxValue: providerAlarm.prmax,
              minValue: providerAlarm.prmin,
            ),
            const SizedBox(
              width: 10,
            ),
            IndicatorWhite(
              firstText: 'SpO',
              subscriptText: '2',
              numberText1: provider.spo2,
              bottomFirstText: '%',
              constValue: 2,
              maxValue: providerAlarm.spo2max,
              minValue: providerAlarm.spo2min,
            ),
            const SizedBox(
              width: 10,
            ),
            IndicatorWhite(
              firstText: 'PIP',
              numberText1: provider.pip,
              bottomFirstText: 'cmH',
              bottomSubscriptText: '2',
              bottomSecondText: 'O',
              constValue: 3,
              maxValue: providerAlarm.pipmax,
              minValue: providerAlarm.pipmin,
            ),
            const SizedBox(
              width: 10,
            ),
            IndicatorWhite(
              firstText: 'PEEP',
              numberText1: provider.peep,
              bottomFirstText: 'cmH',
              bottomSubscriptText: '2',
              bottomSecondText: 'O',
              constValue: 4,
              maxValue: providerAlarm.peepmax,
              minValue: providerAlarm.peepmin,
            ),
            const SizedBox(
              width: 10,
            ),
            IndicatorWhite(
              firstText: 'I:E',
              numberText1: provider.i_e.substring(0, 1),
              numberText2: provider.i_e.substring(2),
              bottomFirstText: '',
              constValue: 100,
              maxValue: 100,
              minValue: 0,
            ),
          ],
        ),
      );
    });
  }
}
