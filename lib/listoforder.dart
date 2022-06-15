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
    ref.refresh(userDataProvider);
  }

  bool isChecked = false;
  // This widget is the root of your application.
  @override
  Widget build(
    BuildContext context,
  ) {
    final userdata = ref.watch(userDataProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF31C6A8),
            leading: const BackButton(
              color: Colors.white,
            ),
            centerTitle: true,
            title: const Text('Completed order'),
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
                              color: const Color(0xFFF0FAF9),
                              height: MediaQuery.of(context).size.height / 5.0,
                              width: MediaQuery.of(context).size.width / 1.20,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      userDataProvider[0].name.toString(),
                                      style: const TextStyle(
                                          color: Color(0xFF31C6A8),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Color(0xFFB0B2C7),
                                          radius: 30.0,
                                        ),
                                        Spacer(
                                          flex: 1,
                                        ),
                                        const Icon(
                                          Icons.watch_later_outlined,
                                          color: Color(0xFF3CA5A0),
                                        ),
                                        const Text(
                                          '10:30',
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: Color.fromARGB(
                                                  255, 155, 166, 166)),
                                        ),
                                        Spacer(
                                          flex: 1,
                                        ),
                                        Icon(
                                          Icons.calendar_today_rounded,
                                          color: Color(0xFF3CA5A0),
                                        ),
                                        Text(
                                          '06 May, 2021',
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              color: Color.fromARGB(
                                                  255, 155, 166, 166)),
                                        ),
                                        Spacer(
                                          flex: 1,
                                        ),
                                        Checkbox(
                                          checkColor: Colors.white,
                                          activeColor: const Color(0xFF3CA5A0),
                                          value: isChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = value!;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.0,
                                    ),
                                    Text(
                                      'Prescription consultation',
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          color: Color.fromARGB(
                                              255, 155, 166, 166)),
                                    ),
                                    Divider(
                                      thickness: 2.0,
                                      indent: 8.0,
                                      endIndent: 8.0,
                                    ),
                                    Text(
                                      'FINISHED',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ViewOrder()));
                      },
                    )
                  ],
                )),
              );
            },
            error: (err, s) => Center(
              child: Text(
                'No Internet',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
          )),
    );
  }
}
