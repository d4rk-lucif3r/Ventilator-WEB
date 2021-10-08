import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'package:ventilator_ui/home/constant.dart';
import 'graphs/graphs.dart';
import 'indicators/indicators.dart';
import 'plusminusbp/plusminusbp.dart';
import 'profile/profile.dart';

class InformationTab extends StatelessWidget {
  const InformationTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 0,
        top: 10,
        left: 5,
        right: 5,
      ),
      decoration: const BoxDecoration(
        // color: Color(0xffd0ffff),
        // color: Colors.white,
        color: Color(0xffECF2FE),
        //d4ffdf
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black45,
        //     blurRadius: 2,
        //     offset: Offset(4, 4),
        //   ),
        //   BoxShadow(
        //     color: Colors.black26,
        //     blurRadius: 1,
        //     offset: Offset(-1, -1),
        //   ),
        // ],
      ),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UpdateAlarm(),
          ),
          ChangeNotifierProvider(
            create: (_) => RealTimeClass(),
          ),
        ],
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            //TODO: Indicator White
            const Expanded(
              flex: 5,
              child: Indicators(),
            ),
            SizedBox(
              height: 5,
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Expanded(
              flex: 20,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: const [
                    //TODO: Graphs
                    Expanded(
                      flex: 5,
                      child: Graphs(),
                    ),

                    //TODO: PlusMinus
                    Expanded(
                      flex: 3,
                      child: PlusMinusBP(),
                    ),

                    //TODO: Profile
                    Expanded(
                      flex: 2,
                      child: Profile(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
