import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ventilator_ui/connect/login.dart';
import 'package:ventilator_ui/connect/services.dart';
import 'package:ventilator_ui/home/display.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    bool emailIsFocused = false;
    bool passwordIsFocused = false;

    return LayoutBuilder(builder: (context, constraints) {
      return DefaultTextStyle(
        style: const TextStyle(
          inherit: false,
        ),
        child: Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xffd0ffff),
                  Colors.grey.shade300,
                ],
                stops: const [
                  .01,
                  .7,
                ]),
          ),
          child: Row(
            children: const [
              Expanded(
                flex: 10,
                child: LogInImageWindow(),
              ),
              Expanded(
                flex: 10,
                child: LogInWindow(),
              ),
              SizedBox(
                width: 100,
              ),
            ],
          ),
        ),
      );
    });
  }
}

class LogInImageWindow extends StatelessWidget {
  const LogInImageWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        alignment: Alignment.centerRight,
        child: Container(
          width: constraints.maxWidth * .7,
          height: constraints.maxHeight * .4,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Expanded(
                flex: 2,
                child: Image(
                  image: AssetImage('assets/logo/Vento Logo BT I.png'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 1,
                child: Image(
                  image: AssetImage('assets/logo/VM Txt.png'),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class LogInWindow extends StatefulWidget {
  const LogInWindow({Key? key}) : super(key: key);

  @override
  State<LogInWindow> createState() => _LogInWindowState();
}

class _LogInWindowState extends State<LogInWindow> {
  @override
  Widget build(BuildContext context) {
    String emailAddress = "";
    String password = "";
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    bool selectedIndex = false;
    bool linkIsValid = false;

    const credentials = {"username": 'email', "password": 'password'};

    List<Widget> buttonWidgetList = [
      LayoutBuilder(
        key: const Key('1'),
        builder: (context, constraints) {
          return const Center(
            child: Center(
              child: Text(
                'Log In',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
          );
        },
      ),
      LayoutBuilder(
        key: const Key('2'),
        builder: (context, contraints) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              color: Colors.black,
            ),
          );
        },
      ),
    ];
    Widget buttonWidget = buttonWidgetList[1];

    @protected
    @mustCallSuper
    void dispose() {
      emailController.dispose();
      passwordController.dispose();
    }

    return Container(
      width: double.infinity,
      height: double.maxFinite,
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 400, maxWidth: 400),
        child: LayoutBuilder(
          builder: (context, innerconstraints) {
            return SizedBox.expand(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(2, 3),
                      color: Colors.black54,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                        flex: 2,
                        child: LayoutBuilder(
                          builder: (context, descripConstraints) {
                            return Center(
                              child: Container(
                                color: Colors.transparent,
                                width: descripConstraints.maxWidth * .9,
                                height: descripConstraints.maxHeight * .9,
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      'Hello!',
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.blue[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                      minFontSize: 18,
                                      maxLines: 1,
                                    ),
                                    AutoSizeText(
                                      'Please log in to your account',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                      minFontSize: 16,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.transparent,
                        child: LayoutBuilder(
                          builder: (context, textFieldConstraints) {
                            return Material(
                              color: Colors.white,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: textFieldConstraints.maxWidth * .9,
                                    height: 60,
                                    color: Colors.transparent,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: emailController,
                                            onTap: () {},
                                            onChanged: (value) {
                                              emailAddress = value;
                                            },
                                            onEditingComplete: () {},
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                            scrollPadding:
                                                const EdgeInsets.all(10),
                                            autocorrect: false,
                                            autofocus: true,
                                            showCursor: true,
                                            obscureText: false,
                                            cursorWidth: .5,
                                            decoration: InputDecoration(
                                              hintText: 'Email/Username',
                                              hintStyle: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[450],
                                              ),
                                              fillColor: Colors.white,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: .5,
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: .5,
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: .5,
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              // OutlineInputBorder(
                                              //   borderSide: BorderSide(
                                              //     color: Colors.teal.shade300,
                                              //     width: 2,
                                              //     style: BorderStyle.solid,
                                              //   ),
                                              //   borderRadius:
                                              //       BorderRadius.circular(10),
                                              // ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                          width: textFieldConstraints.maxWidth,
                                          child: Container(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: textFieldConstraints.maxWidth * .9,
                                    height: 60,
                                    color: Colors.transparent,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: passwordController,
                                            onTap: () {},
                                            onChanged: (value) {
                                              password = value;
                                            },
                                            onEditingComplete: () {},
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                            scrollPadding:
                                                const EdgeInsets.all(10),
                                            autocorrect: false,
                                            autofocus: true,
                                            showCursor: true,
                                            obscureText: true,
                                            cursorWidth: .5,
                                            decoration: InputDecoration(
                                              hintText: 'Password',
                                              hintStyle: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[450],
                                              ),
                                              fillColor: Colors.white,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: .5,
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: .5,
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: .5,
                                                  style: BorderStyle.solid,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              // OutlineInputBorder(
                                              //   borderSide: BorderSide(
                                              //     color: Colors.teal.shade300,
                                              //     width: 2,
                                              //     style: BorderStyle.solid,
                                              //   ),
                                              //   borderRadius:
                                              //       BorderRadius.circular(10),
                                              // ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                          width: textFieldConstraints.maxWidth,
                                          child: Container(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        child: Container(
                          width: innerconstraints.maxWidth * .9,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: BoxConstraints(
                            maxHeight: 60,
                            maxWidth: innerconstraints.maxWidth * 65,
                          ),
                          padding: EdgeInsets.all(1),
                          child: MaterialButton(
                            color: Color(0xffd0ffff),
                            splashColor: const Color(0xffd0ffff),
                            focusColor: const Color(0xffd0ffff),
                            highlightColor: Colors.transparent,
                            hoverColor: const Color(0xffd0ffff),
                            hoverElevation: 16,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: const BorderSide(
                                style: BorderStyle.solid,
                                color: Color(0xff9ecccc),
                              ),
                            ),
                            onPressed: () async {
                              emailController.clear();
                              passwordController.clear();

                              // var data = json.encode(credentials);
                              // var extract = json.decode(data);
                              // debugPrint(extract["username"]);
                              // debugPrint(
                              //     "${credentials["username"]}, ${credentials["password"]}");
                              // setState(() {
                              //   // buttonWidget = buttonWidgetList[0];
                              //   selectedIndex = true;
                              //   debugPrint("HH");
                              // });

                              // if (emailAddress.isNotEmpty &&
                              //     password.isNotEmpty) {
                              //   debugPrint(
                              //       "Email : $emailAddress \nPassword: $password");
                              //   var loginCred =
                              //       await login(emailAddress, password);
                              //   debugPrint("Button Events: \n\n${loginCred}");

                              //   // ignore: dead_code
                              //   if (loginCred == 200) {
                              //     dispose();
                              //     Navigator.pop(context);
                              //     // debugPrint("${loginCred}");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Display(),
                                ),
                              );

                              // Timer timer;
                              // timer = Timer.periodic(
                              //     Duration(milliseconds: 500),
                              //     (timer) async {
                              //   List<dynamic> streamData =
                              //       await fetchData("data?stream=1");

                              //   var pr = streamData[0]['1'].toString();
                              //   var spo2 = streamData[0]['2'].toString();
                              //   var pip = streamData[0]['3'].toString();
                              //   var peep = streamData[0]['4'].toString();
                              //   var i_e = streamData[0]['5'].toString();
                              //   var dia = streamData[0]['8'].toString();
                              //   var sys = streamData[0]['9'].toString();
                              //   var ecg1 = streamData[0]['6'];
                              //   debugPrint(
                              //       "ID : ${streamData[0]['0'].toString()}, $pr, $spo2, $pip, $peep, $i_e, $dia, $sys, $ecg1");
                              // });
                              //   }
                              // } else {
                              //   debugPrint("Email or password is missing");
                              // }
                            },
                            child: AnimatedSwitcher(
                              key: UniqueKey(),
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder: (child, animation) {
                                return SizeTransition(
                                  sizeFactor: animation,
                                  child: child,
                                );
                              },
                              child: selectedIndex == false
                                  ? LayoutBuilder(
                                      key: const ValueKey<int>(0),
                                      builder: (context, constraints) {
                                        return const Center(
                                          child: Center(
                                            child: Text(
                                              'Log In',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : LayoutBuilder(
                                      key: const ValueKey<int>(1),
                                      builder: (context, contraints) {
                                        return const Center(
                                          child: CircularProgressIndicator(
                                            backgroundColor: Colors.transparent,
                                            color: Colors.black,
                                          ),
                                        );
                                      },
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
