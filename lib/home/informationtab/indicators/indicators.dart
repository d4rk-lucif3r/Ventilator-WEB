import 'package:flutter/material.dart';

import 'indicatorwhite.dart';

class Indicators extends StatelessWidget {
  const Indicators({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Row(
        children: const [
          IndicatorWhite(
            firstText: 'PR',
            numberText1: 0,
            bottomFirstText: '/m',
          ),
          IndicatorWhite(
            firstText: 'SpO',
            subscriptText: '2',
            numberText1: 0,
            bottomFirstText: '%',
          ),
          IndicatorWhite(
            firstText: 'PIP',
            numberText1: 6,
            bottomFirstText: 'cmH',
            bottomSubscriptText: '2',
            bottomSecondText: 'O',
          ),
          IndicatorWhite(
            firstText: 'PEEP',
            numberText1: 60,
            bottomFirstText: 'cmH',
            bottomSubscriptText: '2',
            bottomSecondText: 'O',
          ),
          IndicatorWhite(
            firstText: 'I:E',
            numberText1: 1,
            numberText2: 2,
            bottomFirstText: '',
          ),
        ],
      ),
    );
  }
}
