import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'topbutton.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        inherit: false,
      ),
      child: Container(
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
            Expanded(
              flex: 1,
              child: Row(
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.location_on,
                    size: 26,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  AutoSizeText(
                    'Badli Road, Gurugram, 122505',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    minFontSize: 12,
                    maxLines: 1,
                  ),
                ],
              ),
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
                      flex: 3,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 6,
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
      ),
    );
  }
}
