import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:age/age.dart';

class UmurHomePage extends StatefulWidget {
  @override
  _UmurHomePageState createState() => _UmurHomePageState();
}

class _UmurHomePageState extends State<UmurHomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  TextEditingController tahunController = TextEditingController();
  TextEditingController bulanController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();

  int tahun, bulan, tanggal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Age Counter'),
      ),
      body:Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 25),
            Container(
                width: 150,
                child: TextField(
                  decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width:2),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width:2)
                      ),
                      hintText: 'Year'
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: tahunController,
                )
            ),
            SizedBox(height: 10,),
            Container(
                width: 150,
                child: TextField(
                  decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width:2),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width:2)
                      ),
                      hintText: 'Month'
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: bulanController,
                )
            ),
            SizedBox(height: 10,),
            Container(
                width: 150,
                child: TextField(
                  decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width:2),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue, width:2)
                      ),
                      hintText: 'Date'
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: tanggalController
                )
            ),
            SizedBox(height: 10,),
            Container(
                width: 150,
                child: MaterialButton(
                  color: Colors.blue,
                  child: Text('Submit', style: TextStyle(color: Colors.white)),
                  onPressed: (){
                    setState(() {
                      tahun = int.parse(tahunController.text);
                      bulan = int.parse(bulanController.text);
                      tanggal = int.parse(tanggalController.text);
                    });
                    DateTime ultah = DateTime(tahun, bulan, tanggal);
                    DateTime sekarang = DateTime.now();

                    AgeDuration umur;

                    umur = Age.dateDifference(fromDate: ultah, toDate: sekarang, includeToDate: false);
                    return showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          content: Text('Your age is $umur'),
                        );
                      }
                    );
                  }
                ),
            ),
          ],
        ),
      )

    );
  }
}
