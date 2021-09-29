import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        // child: Column(
        //   mainAxisAlignment:
        //       MainAxisAlignment.start,
        //   crossAxisAlignment:
        //       CrossAxisAlignment.center,
        //   children: const [
        //     AspectRatio(
        //       aspectRatio: 1,
        //       child: CircleAvatar(
        //         minRadius: 20,
        //         child: Icon(
        //           Icons.person,
        //           size: 48,
        //         ),
        //         backgroundColor: Colors.grey,
        //       ),
        //     ),
        //     Text('Rishikesh'),
        //     Text('Age: 21'),
        //     Text('Sex: Female'),
        //   ],
        // ),
      ),
    );
  }
}
