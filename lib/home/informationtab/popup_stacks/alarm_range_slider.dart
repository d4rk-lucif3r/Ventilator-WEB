import 'package:flutter/material.dart';
import 'package:ventilator_ui/connect/alarmsync.dart';

class AlarmSlider extends StatefulWidget {
  // const SliderTest({Key? key}) : super(key: key);
  final double sliderHeight;
  final int min;
  final int max;
  final int divisions;
  // final bool fullWidth;
  final AlarmSync provider;
  final String title;

  // ignore: use_key_in_widget_constructors
  AlarmSlider({
    this.sliderHeight = 48,
    required this.max,
    required this.min,
    required this.divisions,
    required this.provider,
    required this.title,
    // this.fullWidth = false,
  });

  @override
  State<AlarmSlider> createState() => _AlarmSliderState();
}

class _AlarmSliderState extends State<AlarmSlider> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  late int sliderMin;
  late int sliderMax;

  @override
  Widget build(BuildContext context) {
    String name = widget.title;

    switch (name) {
      case "PR":
        sliderMax = widget.provider.tempprmax;
        sliderMin = widget.provider.tempprmin;
        break;
      case "SpO2":
        sliderMax = widget.provider.tempspo2max;
        sliderMin = widget.provider.tempspo2min;
        break;
      case "DIA":
        sliderMax = widget.provider.tempdiamax;
        sliderMin = widget.provider.tempdiamin;
        break;
      case "SYS":
        sliderMax = widget.provider.tempsysmax;
        sliderMin = widget.provider.tempsysmin;
        break;
      default:
        // sliderMax = 0;
        // sliderMin = 100;
        debugPrint('ERROR : Range Value Substitution');
    }
    // debugPrint(sliderMax.runtimeType.toString());
    // debugPrint(sliderMin.runtimeType.toString());

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.only(
            left: 5,
            right: 5,
            top: 5,
            bottom: 5,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Scaffold(
            // backgroundColor: Colors.transparent,

            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: constraints.maxWidth,
                  height: 35,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    // color: const Color(0xff2D2C2C).withOpacity(.2),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff2D2C2C).withOpacity(.2),
                        Color(0xffB9B8B8).withOpacity(.2),
                        Color(0xff2D2C2C).withOpacity(.15),
                      ],
                      stops: const [
                        .01,
                        .7,
                        .99,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "$sliderMin",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white.withOpacity(.8),
                            inactiveTrackColor:
                                const Color(0xffB9B8B8).withOpacity(.8),
                            thumbColor: Colors.white,
                            trackHeight: 5.0,
                            valueIndicatorTextStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            showValueIndicator: ShowValueIndicator.always,
                            overlayColor: Colors.white.withOpacity(.2),
                            valueIndicatorColor: Colors.grey.withOpacity(.8),
                            activeTickMarkColor: Colors.white,
                            inactiveTickMarkColor:
                                const Color(0xffB9B8B8).withOpacity(.2),
                          ),
                          child: RangeSlider(
                            values: RangeValues(
                              sliderMin.toDouble(),
                              sliderMax.toDouble(),
                            ),
                            max: widget.max.toDouble(),
                            min: widget.min.toDouble(),
                            divisions: widget.divisions,
                            labels: RangeLabels(
                              _currentRangeValues.start.round().toString(),
                              _currentRangeValues.end.round().toString(),
                            ),
                            onChanged: (RangeValues values) {
                              setState(
                                () {
                                  _currentRangeValues = values;
                                  // debugPrint("${values.start}");
                                  sliderMin = (values.start).toInt();
                                  sliderMax = (values.end).toInt();

                                  switch (name) {
                                    case "PR":
                                      widget.provider.tempAlarmUpdate(
                                          'tempprmax', values.end.toInt());
                                      widget.provider.tempAlarmUpdate(
                                          'tempprmin', values.start.toInt());
                                      break;
                                    case "SpO2":
                                      widget.provider.tempAlarmUpdate(
                                          'tempspo2max', values.end.toInt());
                                      widget.provider.tempAlarmUpdate(
                                          'tempspo2min', values.start.toInt());

                                      break;
                                    case "DIA":
                                      widget.provider.tempAlarmUpdate(
                                          'tempdiamax', values.end.toInt());
                                      widget.provider.tempAlarmUpdate(
                                          'tempdiamin', values.start.toInt());
                                      break;
                                    case "SYS":
                                      widget.provider.tempAlarmUpdate(
                                          'tempsysmax', values.end.toInt());
                                      widget.provider.tempAlarmUpdate(
                                          'tempsysmin', values.start.toInt());
                                      break;
                                    default:
                                      sliderMax = 0;
                                      sliderMin = 10;
                                  }
                                  // debugPrint("It ends here");
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Text(
                        "$sliderMax",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
