import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PatientProfile extends StatelessWidget {
  PatientProfile({
    Key? key,
    required this.pname,
    required this.page,
    required this.psex,
    required this.pheight,
    required this.pweight,
    required this.pbloodGroup,
  }) : super(key: key);

  final String pname;
  final String page;
  final String psex;
  final String pheight;
  final String pweight;
  final String pbloodGroup;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((BuildContext context, BoxConstraints constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          padding: EdgeInsets.all(constraints.maxWidth / 14),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 0,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.transparent,
                child: const Center(
                  child: Image(
                    image: AssetImage('assets/logo/female-logo.png'),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ProfileText(paramName: 'Name', name: pname),
              const SizedBox(
                height: 5,
              ),
              ProfileText(paramName: 'Age', name: page),
              const SizedBox(
                height: 5,
              ),
              ProfileText(paramName: 'Sex', name: psex),
              const SizedBox(
                height: 5,
              ),
              ProfileText(paramName: 'Blood', name: pbloodGroup),
              const SizedBox(
                height: 5,
              ),
              ProfileText(paramName: 'Height', name: '$pheight cm'),
              const SizedBox(
                height: 5,
              ),
              ProfileText(paramName: 'Weight', name: '$pweight Kg'),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        );
      }),
    );
  }
}

class ProfileText extends StatelessWidget {
  const ProfileText({
    Key? key,
    this.name,
    required this.paramName,
  }) : super(key: key);

  final String? name;
  final String paramName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            "$paramName : $name",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            maxLines: 1,
          ),
        ),
        // Expanded(
        //   flex: 3,
        //   child: Text(
        //     ": $name",
        //     style: const TextStyle(
        //       color: Colors.black,
        //       fontWeight: FontWeight.normal,
        //       fontSize: 11,
        //     ),
        //     maxLines: 1,
        //     overflow: TextOverflow.ellipsis,
        //   ),
        // ),
      ],
    );
  }
}
