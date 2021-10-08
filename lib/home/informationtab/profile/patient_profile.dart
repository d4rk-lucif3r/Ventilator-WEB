import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PatientProfile extends StatelessWidget {
  const PatientProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((BuildContext context, BoxConstraints constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              height: 40,
            ),
            AspectRatio(
              aspectRatio: 2,
              child: Center(
                child: Image(
                  image: AssetImage('assets/logo/female-logo.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ProfileText(
              paramName: 'NAME',
              name: 'Rishikesh Meitramayum Singh',
            ),
            ProfileText(paramName: 'AGE', name: '21'),
            ProfileText(paramName: 'SEX', name: 'Female'),
            ProfileText(paramName: 'BLOOD', name: 'Z+'),
            ProfileText(paramName: 'HEIGHT', name: '163 cm'),
            ProfileText(paramName: 'WEIGHT', name: '91 Kg'),
          ],
        );
      }),
    );
  }
}

class ProfileText extends StatelessWidget {
  const ProfileText({
    Key? key,
    required this.name,
    required this.paramName,
  }) : super(key: key);

  final String name;
  final String paramName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: AutoSizeText(
              paramName,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              minFontSize: 12,
              maxLines: 1,
            ),
          ),
          Expanded(
            flex: 3,
            child: AutoSizeText(
              ": $name",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              minFontSize: 12,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
