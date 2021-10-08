import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ventilator_ui/home/constant.dart';
import 'package:ventilator_ui/home/informationtab/profile/patient_profile.dart';
import 'package:provider/provider.dart';
import 'indicator_profile.dart';

class Profile extends StatefulWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // void updateSwitcher() {
  //   setState(() {});
  // }

  Widget _widgetRenderer(int value) {
    switch (value) {
      case 0:
        return const PatientProfile();
        break;
      case 1:
        return IndicatorProfile(
          maxValue: alarmName[value][0][0],
          minValue: alarmName[value][0][1],
          firstText: alarmName[value][1][0],
        );
        break;
      case 2:
        return IndicatorProfile(
            maxValue: alarmName[value][0][0],
            minValue: alarmName[value][0][1],
            firstText: alarmName[value][1][0]);
        break;
      case 3:
        return IndicatorProfile(
            maxValue: alarmName[value][0][0],
            minValue: alarmName[value][0][1],
            firstText: alarmName[value][1][0]);
        break;
      case 4:
        return IndicatorProfile(
            maxValue: alarmName[value][0][0],
            minValue: alarmName[value][0][1],
            firstText: alarmName[value][1][0]);
        break;
      default:
        return const PatientProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    var isPRopened = true;

    // print("Local widget width: $w and height: $h");

    return Consumer<UpdateAlarm>(
      builder: (context, provider, child) {
        return DefaultTextStyle(
          style: const TextStyle(
            inherit: false,
            fontSize: 32,
            color: Colors.black,
          ),
          child: Container(
            margin: const EdgeInsets.only(
              top: 5,
              right: 20,
              left: 5,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 2,
                  offset: Offset(4, 4),
                ),
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 1,
                  offset: Offset(-1, -1),
                ),
              ],
            ),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 100),
              child: _widgetRenderer(provider.isWhichSwitch),
              // isWhichSwitch == 'default'
              //     ? PatientProfile()
              //     : IndicatorProfile(
              //         valueText: 100,
              //         firstText: alarmName[isWhichSwitch][0],
              //         subscriptText: alarmName[isWhichSwitch][1],
              //       ),
            ),
          ),
        );
      },
    );
  }
}
