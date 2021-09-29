import 'package:flutter/material.dart';

class Graphs extends StatelessWidget {
  const Graphs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
        left: 20,
        right: 10,
        bottom: 10,
      ),
      color: Colors.transparent,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(10),
      //   boxShadow: const [
      //     BoxShadow(
      //       color: Colors.black45,
      //       blurRadius: 2,
      //       offset: Offset(4, 4),
      //     ),
      //     BoxShadow(
      //       color: Colors.black26,
      //       blurRadius: 1,
      //       offset: Offset(-1, -1),
      //     ),
      //   ],
      // ),
      child: Column(
        children: const [
          Expanded(
            flex: 1,
            child: Graph(),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Graph(),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Graph(),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Graph(),
          ),
        ],
      ),
    );
  }
}

class Graph extends StatelessWidget {
  const Graph({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        //#828388
        // color: Colors.blueGrey.shade300.withOpacity(.4),
        //#ECF2FE
        // color: const Color(0xffECF2FE),

        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(4, 4),
            blurRadius: 4,
          ),
          BoxShadow(
            color: Colors.black12,
            offset: Offset(-1, -1),
            // spreadRadius: 3,
            blurRadius: 3,
          ),
        ],
      ),
    );
  }
}
