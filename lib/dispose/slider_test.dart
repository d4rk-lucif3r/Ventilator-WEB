import 'package:flutter/material.dart';

class SliderTest extends StatefulWidget {
  // const SliderTest({Key? key}) : super(key: key);
  final double sliderHeight;
  final int min;
  final int max;
  final bool fullWidth;

  // ignore: use_key_in_widget_constructors
  const SliderTest(
      {this.sliderHeight = 48,
      this.max = 10,
      this.min = 0,
      this.fullWidth = false});

  @override
  State<SliderTest> createState() => _SliderTestState();
}

class _SliderTestState extends State<SliderTest> {
  RangeValues _currentRangeValues = const RangeValues(40, 80);
  int sliderMin = 30;
  int sliderMax = 90;

  @override
  Widget build(BuildContext context) {
    // RangeValues values = RangeValues(1, 100);
    // RangeLabels labels = RangeLabels('1', "100");

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Center(
          child: Container(
            width: constraints.maxWidth,
            height: 50,
            margin: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: const Color(0xff2D2C2C).withOpacity(.2),
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
                      values: _currentRangeValues,
                      max: 100,
                      min: 0,
                      divisions: 90,
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
        ),
      );
    });
  }
}

// class CustomSliderThumbCircle extends RangeSliderThumbShape {
//   final double thumbRadius;
//   final int min;
//   final int max;

//   const CustomSliderThumbCircle({
//     required this.thumbRadius,
//     this.min = 0,
//     this.max = 10,
//   });

//   @override
//   Size getPreferredSize(bool isEnabled, bool isDiscrete) {
//     return Size.fromRadius(thumbRadius);
//   }

//   @override
//   void paint(
//     PaintingContext context,
//     Offset center, {
//     required Animation<double> activationAnimation,
//     required Animation<double> enableAnimation,
//     required bool isDiscrete,
//     required TextPainter labelPainter,
//     required RenderBox parentBox,
//     required SliderThemeData sliderTheme,
//     required TextDirection textDirection,
//     required double value,
//     required double textScaleFactor,
//     required Size sizeWithOverflow,
//   }) {
//     final Canvas canvas = context.canvas;

//     final paint = Paint()
//       ..color = Colors.white //Thumb Background Color
//       ..style = PaintingStyle.fill;

//     TextSpan span =  TextSpan(
//       style:  TextStyle(
//         fontSize: thumbRadius * .8,
//         fontWeight: FontWeight.w700,
//         color: sliderTheme.thumbColor, //Text Color of Value on Thumb
//       ),
//       text: getValue(value),
//     );

//     TextPainter tp =  TextPainter(
//         text: span,
//         textAlign: TextAlign.center,
//         textDirection: TextDirection.ltr);
//     tp.layout();
//     Offset textCenter =
//         Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

//     canvas.drawCircle(center, thumbRadius * .9, paint);
//     tp.paint(canvas, textCenter);
//   }

//   String getValue(double value) {
//     return (min + (max - min) * value).round().toString();
//   }
// }
