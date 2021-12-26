import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/alarmsync.dart';
import 'package:ventilator_ui/home/informationtab/popup_stacks/alarm_range_slider.dart';
import 'package:ventilator_ui/ui_control_center/transition_manager.dart';

class PopUpAlarms extends StatefulWidget {
  const PopUpAlarms({
    Key? key,
    required this.updateState,
  }) : super(key: key);
  final Function updateState;

  @override
  _PopUpAlarmsState createState() => _PopUpAlarmsState();
}

class _PopUpAlarmsState extends State<PopUpAlarms> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Consumer2<AlarmSync, TransitionManager>(
            builder: (context, provider, transprovider, child) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  offset: const Offset(0, 4),
                  blurRadius: 100,
                  spreadRadius: 10000,
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  // width: double.maxFinite,
                                  // height: 200,
                                  color: Colors.transparent,
                                  child: AlarmSlider(
                                    title: 'PR',
                                    min: 0,
                                    max: 200,
                                    divisions: 100,
                                    provider: provider,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: double.maxFinite,
                                  height: 200,
                                  color: Colors.transparent,
                                  child: AlarmSlider(
                                    title: 'SpO2',
                                    min: 0,
                                    max: 200,
                                    divisions: 100,
                                    provider: provider,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.maxFinite,
                                  height: 200,
                                  color: Colors.transparent,
                                  child: AlarmSlider(
                                    title: 'SYS',
                                    min: 0,
                                    max: 200,
                                    divisions: 100,
                                    provider: provider,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  width: double.maxFinite,
                                  height: 200,
                                  color: Colors.transparent,
                                  child: AlarmSlider(
                                    title: 'DIA',
                                    min: 0,
                                    max: 200,
                                    divisions: 100,
                                    provider: provider,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            transprovider.popUpCheck('alarms', false);
                            widget.updateState();
                          },
                          child: Container(
                            width: 120,
                            height: 40,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "Discard",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 0,
                        ),
                        GestureDetector(
                          onTap: () {
                            // provider.pushAlarmUpdate();
                            transprovider.popUpCheck('alarms', false);
                            widget.updateState();
                          },
                          child: Container(
                            width: 120,
                            height: 40,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
