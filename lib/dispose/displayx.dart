import 'package:flutter/material.dart';

class DisplayX extends StatelessWidget {
  const DisplayX({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
        top: 10,
        right: 10,
        left: 10,
      ),
      width: double.infinity,
      height: double.maxFinite,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Expanded(
                    flex: 20,
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              color: Colors.transparent,

                              // ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              color: Colors.transparent,
                              child: Column(
                                children: const [
                                  Graph(),
                                  Graph(),
                                  Graph(),
                                  Graph(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      color: Colors.transparent,
                      child: Row(
                        children: const [
                          BottomTab(),
                          BottomTab(),
                          BottomTab(),
                          BottomTab(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.lime.shade600,
            ),
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
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400.withOpacity(.6),
              blurRadius: 3,
              offset: const Offset(5, 5),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomTab extends StatelessWidget {
  const BottomTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400.withOpacity(.6),
                blurRadius: 3,
                offset: const Offset(5, 5),
              ),
            ]),
      ),
    );
  }
}


// class _ChartData {
//   _ChartData(this.x, this.y);
//   final int x;
//   final int y;
// }

//   @override
//   Widget build(BuildContext context) {
//     return
//     // SfCartesianChart(
//     //   margin: const EdgeInsets.only(
//     //     left: 15,
//     //     right: 15,
//     //     top: 10,
//     //     bottom: 5,
//     //   ),
//     //   primaryXAxis: NumericAxis(
//     //     majorGridLines: const MajorGridLines(width: .7),
//     //     interval: 1,
//     //   ),
//     //   primaryYAxis: NumericAxis(
//     //     majorTickLines: const MajorTickLines(
//     //       width: .7,
//     //       color: Colors.transparent,
//     //     ),
//     //     interval: 1,
//     //   ),
//     //   series: <SplineSeries<SalesData, double>>[
//     //     SplineSeries<SalesData, double>(
//     //         // Bind data source
//     //         dataSource: <SalesData>[
//     //           SalesData(2, 1),
//     //           SalesData(4, 0),
//     //           SalesData(6, -2),
//     //           SalesData(8, 0),
//     //           SalesData(10, -1),
//     //           SalesData(12, 0),
//     //           SalesData(14, 1),
//     //           SalesData(16, 0),
//     //           SalesData(18, -5),
//     //           SalesData(20, 0),
//     //         ],
//     //         // xValueMapper: (SalesData sales, _) => sales.year,
//     //         xValueMapper: (SalesData sales, _) => sales.year,
//     //         yValueMapper: (SalesData sales, _) => sales.sales)
//     //   ],
//     // );
//   }
// }

// class SalesData {
//   SalesData(this.year, this.sales);
//   final double year;
//   final double sales;
// }
