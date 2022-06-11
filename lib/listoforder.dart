import 'package:avaproject/vieworder.dart';
import 'package:flutter/material.dart';
import 'package:avaproject/model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListOfOrder extends ConsumerStatefulWidget {
  const ListOfOrder({Key? key}) : super(key: key);

  @override
  ConsumerState<ListOfOrder> createState() => _ListOfOrderState();
}

class _ListOfOrderState extends ConsumerState<ListOfOrder> {
  @override
  void initState() {
    // fetchProfileData();
    super.initState();
  }

  bool isChecked = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ) {
    final userdata = ref.watch(userDataProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF31C6A8),
            leading: BackButton(
              color: Colors.white,
            ),
            centerTitle: true,
            title: Text('Completed order'),
          ),
          body: userdata.when(
            data: (userDataProvider) {
              return Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 10),
                child: Center(
                    child: Column(
                  children: [
                    GestureDetector(
                      child: Card(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Container(
                              //color: Colors.greenAccent,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF3CA5A0),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              height: MediaQuery.of(context).size.height / 14.0,
                              width: MediaQuery.of(context).size.width / 1.20,
                              child: const Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  'Ordered',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              color: Color(0xFFF0FAF9),
                              height: MediaQuery.of(context).size.height / 5.0,
                              width: MediaQuery.of(context).size.width / 1.20,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 10.0,
                                    right: 90.0,
                                    child: Text(
                                      userDataProvider[0].name.toString(),
                                      style: TextStyle(
                                          color: Color(0xFF31C6A8),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Positioned(
                                    top: 45.0,
                                    left: 15.0,
                                    child: CircleAvatar(
                                      backgroundColor: Color(0xFFB0B2C7),
                                      radius: 25.0,
                                    ),
                                  ),
                                  Positioned(
                                    top: 40.0,
                                    right: 170.0,
                                    child: Icon(
                                      Icons.watch_later_outlined,
                                      color: Color(0xFF3CA5A0),
                                    ),
                                  ),
                                  Positioned(
                                    top: 47.0,
                                    right: 145.0,
                                    child: Text(
                                      '10:30',
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          color: Color.fromARGB(
                                              255, 155, 166, 166)),
                                    ),
                                  ),
                                  Positioned(
                                      top: 80.0,
                                      right: 77.0,
                                      child: Text(
                                        'Prescription consultation',
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            color: Color.fromARGB(
                                                255, 155, 166, 166)),
                                      )),
                                  Positioned(
                                    right: 115.0,
                                    top: 40.0,
                                    child: Icon(
                                      Icons.calendar_today_rounded,
                                      color: Color(0xFF3CA5A0),
                                    ),
                                  ),
                                  Positioned(
                                      top: 47.0,
                                      right: 52.0,
                                      child: Text(
                                        '06 May, 2021',
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            color: Color.fromARGB(
                                                255, 155, 166, 166)),
                                      )),
                                  Positioned(
                                    top: 30,
                                    right: 10,
                                    child: Checkbox(
                                      checkColor: Colors.white,
                                      activeColor: Color(0xFF3CA5A0),
                                      value: isChecked,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 40.0,
                                    right: 16.0,
                                    child: Text(
                                        '________________________________________'),
                                  ),
                                  Positioned(
                                    bottom: 15.0,
                                    left: 100.0,
                                    child: Text(
                                      'FINISHED',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewOrder()));
                      },
                    )
                    // Stack(
                    //   children: [
                    //     Card(
                    //       elevation: 10.0,
                    //       child: Container(
                    //         height: 100.0,
                    //         width: 200.0,
                    //       ),
                    //     ),
                    //     Positioned(
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //             color: Colors.greenAccent,
                    //             borderRadius: BorderRadius.circular(30)),
                    //         //color: Colors.lightGreen,
                    //         height: 50.0,
                    //         width: 200.0,
                    //         child: Text('Order'),
                    //       ),
                    //     )
                    //   ],
                    // )
                  ],
                )),
              );
            },
            error: (err, s) => Text(err.toString()),
            loading: () => const Center(child: CircularProgressIndicator()),
            //       } else if (snapshot.hasError) {
            //         return const Scaffold(
            //           body: NoInternet(),
            //         );
            //         //Text('${snapshot.error}');
            //       }
            //       return const CircularProgressIndicator();
            //     },
            //   ),
          )),
    );
  }
}
