import 'package:chart/screen/patient/patient.dart';
import 'package:chart/screen/plan.dart';
import 'package:chart/screen/therapist.dart';
import 'package:chart/loginPage/token_check.dart';
import 'package:chart/widget/patient_drawer.dart';
import 'package:chart/widget/plan_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _index = 0;
  final List<Widget> _pages = [Therapist(), Patient(), Plan()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: _index == 1 ? PatientDrawer() : PlanDrawer(),
        appBar: CupertinoNavigationBar(
          backgroundColor: Colors.transparent,

          leading:
              _index == 0
                  ? null
                  : Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(Icons.menu),
                      );
                    },
                  ),
          middle: Text('chartPT'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                child: Text('로그아웃', style: TextStyle(fontSize: 20)),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder:
                        (BuildContext context) => CupertinoAlertDialog(
                          title: Text('알림'),
                          content: Text('로그아웃하시겠습니까?'),
                          actions: <CupertinoDialogAction>[
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              onPressed: () => Navigator.pop(context),
                              child: Text('아니오'),
                            ),
                            CupertinoDialogAction(
                              isDefaultAction: true,
                              onPressed: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.remove('token');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (builder) => TokenCheck(),
                                  ),
                                );
                              },
                              child: Text('예'),
                            ),
                          ],
                        ),
                  );
                },
              ),
            ],
          ),
        ),
        body: SafeArea(child: Container(child: _pages[_index])),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (value) {
            setState(() {
              _index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.person_4),
              label: 'Therapist',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Patient'),
            BottomNavigationBarItem(
              icon: Icon(Icons.contact_page),
              label: 'Plan',
            ),
          ],
        ),
        //
        //
        //
        //
        //
        //
        //
        //
        //
        // BottomAppBar(
        //   child: Row(
        //     children: [
        //       IconButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => Home()),
        //           );
        //         },
        //         icon: Icon(Icons.home),
        //       ),
        //       IconButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => Home()),
        //           );
        //         },
        //         icon: Icon(Icons.person),
        //       ),
        //       IconButton(
        //         onPressed: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(builder: (context) => Home()),
        //           );
        //         },
        //         icon: Icon(Icons.contact_page),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
