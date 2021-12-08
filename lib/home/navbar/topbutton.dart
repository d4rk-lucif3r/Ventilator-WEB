import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/tempprovider.dart';

class TopButton extends StatefulWidget {
  const TopButton({
    Key? key,
    required this.stringValue,
    this.isFuncActive,
  }) : super(key: key);

  final String stringValue;
  final bool? isFuncActive;

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  var rightPadding = 10;
  var bottomPadding = 15;
  var onHoverState;

  @override
  void initState() {
    // TODO: implement initState
    onHoverState = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TempProvider>(
      builder: (context, tempprovider, child) {
        return MouseRegion(
          onHover: (event) {
            setState(() {
              onHoverState = true;
              // rightPadding = 5;
              // bottomPadding = 10;
            });
          },
          onExit: (event) {
            setState(() {
              onHoverState = false;
              // rightPadding = 10;
              // bottomPadding = 15;
            });
          },
          child: GestureDetector(
            onTap: widget.isFuncActive != null && widget.isFuncActive == true
                ? () {
                    double tempValue = tempprovider.animatedWidth;
                    tempValue = tempValue == 0 ? 200 : 0;
                    tempprovider.updateAnimatedWidth(tempValue);

                    // widget.function;
                    // debugPrint("Bingo");
                  }
                : () {},
            child: Container(
              margin: onHoverState
                  ? const EdgeInsets.only(
                      left: 10,
                      top: 10,
                      right: 10,
                      bottom: 10,
                    )
                  : const EdgeInsets.only(
                      left: 10,
                      top: 13,
                      right: 10,
                      bottom: 7,
                    ),
              decoration: BoxDecoration(
                  // color: const Color(0xffff7e57),
                  //ffa8aa
                  //1976d2
                  color: const Color(0xff1976d2),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: onHoverState
                      ? const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2,
                            offset: Offset(1, 4),
                          ),
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 1,
                            offset: Offset(-1, -1),
                          ),
                        ]
                      : const [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 0,
                            offset: Offset(0, 0),
                          ),
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 0,
                            offset: Offset(0, 0),
                          ),
                        ]),
              alignment: Alignment.center,
              child: Text(
                widget.stringValue,
                style: const TextStyle(
                  color: Colors.white,
                  // color: Color(0xff000000),
                  fontSize: 24,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
