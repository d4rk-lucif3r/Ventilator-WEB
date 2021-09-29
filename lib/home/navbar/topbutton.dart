import 'package:flutter/material.dart';

class TopButton extends StatelessWidget {
  const TopButton({
    Key? key,
    required this.stringValue,
  }) : super(key: key);

  final String stringValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        // color: const Color(0xffff7e57),
        //ffa8aa
        //1976d2
        color: const Color(0xff1976d2),
        // gradient: const LinearGradient(
        //   begin: Alignment.centerLeft,
        //   end: Alignment.centerRight,
        //   colors: [
        //     Color(0xffff4081),
        //     Color(0xffaa00ff),
        //   ],
        //   stops: [
        //     .1,
        //     .7,
        //   ],
        // ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1,
            offset: Offset(-1, -1),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        stringValue,
        style: const TextStyle(
          color: Colors.white,
          // color: Color(0xff000000),
          fontSize: 24,
        ),
      ),
    );
  }
}
