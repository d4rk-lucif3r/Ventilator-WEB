import 'package:flutter/material.dart';

import 'topbutton.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
        // color: Color(0xff81d4fa),
        color: Color(0xffECF2FE),

        //ccf4d7
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
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
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: Text(''),
          ),
          Expanded(
            flex: 1,
            child: DefaultTextStyle(
              style: const TextStyle(
                inherit: false,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: const [
                        Expanded(
                          child: TopButton(
                            stringValue: 'Alarm',
                          ),
                        ),
                        Expanded(
                          child: TopButton(
                            stringValue: 'Mode',
                          ),
                        ),
                        Expanded(
                          child: TopButton(
                            stringValue: 'Settings',
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
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
