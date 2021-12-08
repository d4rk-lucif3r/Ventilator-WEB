import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/graph/chartsync.dart';
import 'package:ventilator_ui/connect/graph/ecg_1_graph.dart';
import 'package:ventilator_ui/connect/graph/ecg_2_graph.dart';
import 'package:ventilator_ui/connect/graph/ecg_3_graph.dart';
import 'package:ventilator_ui/connect/graph/ecg_4_graph.dart';
import 'package:ventilator_ui/connect/realtimefetch.dart';
import 'package:ventilator_ui/connect/tempprovider.dart';
import 'package:ventilator_ui/constants/constant.dart';
import 'package:ventilator_ui/home/informationtab/setting_buttons/setting_buttons.dart';
import 'package:ventilator_ui/home/informationtab/settings/settings.dart';
import 'graphs/graphs.dart';
import 'indicators/indicators.dart';
import 'plusminusbp/plusminusbp.dart';
import 'profile/profile.dart';

class InformationTab extends StatefulWidget {
  const InformationTab({
    Key? key,
    required this.providerg,
    required this.providerecg1,
    required this.providerecg2,
    required this.providerecg3,
    required this.providerecg4,
  }) : super(key: key);
  final RealTimeGraph providerg;
  final ECG1 providerecg1;
  final ECG2 providerecg2;
  final ECG3 providerecg3;
  final ECG4 providerecg4;

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
    print("Information Tab Disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Consumer<TempProvider>(
        builder: (context, tempprovider, child) {
          return Container(
            margin: const EdgeInsets.only(
              bottom: 0,
              top: 10,
              left: 5,
              right: 5,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  height: 10,
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        //TODO: PlusMinus
                        Expanded(
                          flex: 1,
                          child: PlusMinusBP(),
                        ),

                        //TODO: Graphs
                        Expanded(
                          flex: 3,
                          child: Graphs(
                            providerg: widget.providerg,
                            providerecg1: widget.providerecg1,
                            providerecg2: widget.providerecg2,
                            providerecg3: widget.providerecg3,
                            providerecg4: widget.providerecg4,
                          ),
                        ),

                        //TODO: Profile
                        Expanded(
                          flex: 1,
                          child: SettingButtons(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
