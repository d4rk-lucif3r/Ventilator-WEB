import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/graph/chartsync.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'package:ventilator_ui/constants/constant.dart';
import 'graphs/graphs.dart';
import 'indicators/indicators.dart';
import 'plusminusbp/plusminusbp.dart';
import 'profile/profile.dart';

class InformationTab extends StatefulWidget {
  const InformationTab({
    Key? key,required this.providerg,
  }) : super(key: key);
  final RealTimeGraph providerg;

  @override
  State<InformationTab> createState() => _InformationTabState();
}

class _InformationTabState extends State<InformationTab> {
  @override
  void initState() {
    // TODO: implement initState
    print("Information Tab Created");
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("Information Tab Dispose");
    super.dispose();
  }

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
                children:  [
                  //TODO: Graphs
                  Expanded(
                    flex: 5,
                    child: Graphs(providerg: widget.providerg,),
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
    );
  }
}
