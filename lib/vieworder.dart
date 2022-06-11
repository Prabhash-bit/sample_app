import 'package:flutter/material.dart';

class ViewOrder extends StatefulWidget {
  const ViewOrder({Key? key}) : super(key: key);

  @override
  State<ViewOrder> createState() => _ViewOrderState();
}

class _ViewOrderState extends State<ViewOrder> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF31C6A8),
          leading: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              }),
          centerTitle: true,
          title: Text('Prescription'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10.0,
                    mainAxisExtent: 90.0,
                    mainAxisSpacing: 2.0,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Color(0xFF3CA5A0),
                      child: Text("index: $index"),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 20.0),
                child: Text(
                  'Patient Name',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 10.0),
                child: SizedBox(
                  width: 300.0,
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFECF7FB),
                      filled: true,
                      prefixIcon: Icon(Icons.person_outlined),
                      hintText: 'Enter something',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 20.0),
                child: Text(
                  'Title for medicine',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 10.0),
                child: SizedBox(
                  width: 300.0,
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFECF7FB),
                      filled: true,
                      prefixIcon: Icon(Icons.person_outlined),
                      hintText: 'Enter something',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 20.0),
                child: Text(
                  'Signature',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 10.0),
                child: SizedBox(
                  width: 300.0,
                  height: 50.0,
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFECF7FB),
                      filled: true,
                      prefixIcon: Icon(Icons.person_outlined),
                      hintText: 'Enter something',
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2050),
                  onDateChanged: (DateTime value) {}),
              Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF31C6A8), // background
                        // foreground
                      ),
                      onPressed: () {},
                      child: Container(
                        width: 250,
                        child: Text(
                          'Saved',
                          textAlign: TextAlign.center,
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
