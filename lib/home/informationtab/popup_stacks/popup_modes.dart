import 'package:flutter/material.dart';

class PopUpModes extends StatelessWidget {
  const PopUpModes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var w = constraints.maxWidth;
        var h = constraints.maxHeight;
        return Container(
          width: w,
          height: h,
          padding: const EdgeInsets.only(
            top: 30,
            left: 10,
            right: 10,
            bottom: 50,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  offset: const Offset(0, 4),
                  blurRadius: 100,
                  spreadRadius: 10000,
                )
              ]),
          child: Column(
            children: [
              const Text(
                "CONTROL MODE",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 20,
                width: double.infinity,
                child: Center(
                  child: Container(
                    height: .5,
                    width: constraints.maxWidth * .75,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ModesButton(w: w, title: "VC"),
                    ModesButton(w: w, title: "PC"),
                    ModesButton(w: w, title: ""),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class ModesButton extends StatelessWidget {
  const ModesButton({
    Key? key,
    required this.w,
    required this.title,
  }) : super(key: key);

  final double w;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w * .2,
      height: w * .12,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.black,
          width: .5,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
