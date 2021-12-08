import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/tempprovider.dart';

import 'topbutton.dart';

class NavBar extends StatefulWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        inherit: false,
      ),
      child: Consumer<TempProvider>(builder: (context, tempprovider, child) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.only(left: 10),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Icon(
                        Icons.person,
                        size: 36,
                        color: Colors.black,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rishikesh Salam',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '31, Male',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      'Badli Road, Gurugram, 122505',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      minFontSize: 12,
                      maxLines: 1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.location_on,
                      size: 26,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
