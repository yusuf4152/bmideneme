import 'package:bmideneme/sayfa2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Ilksayfa(),
    );
  }
}

class Ilksayfa extends StatefulWidget {
  @override
  _IlksayfaState createState() => _IlksayfaState();
}

class _IlksayfaState extends State<Ilksayfa> {
  Color kiz = Color(0xFFF071CD);
  Color erkek = Color(0xFF00D1FF);
  int boy = 0, kilo = 0, yas = 0;
  double bmi = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDBFFE3),
      appBar: AppBar(
        backgroundColor: Color(0xFFDBFFE3),
        title: Center(
            child: Text(
          "BMI hesaplama",
          style: TextStyle(color: Colors.pink),
        )),
      ),
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Text(
                "Cinsiyetiniz",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        erkek == Color(0xFF00D1FF)
                            ? erkek = Color(0xFF0088B2)
                            : erkek = Color(0xFF00D1FF);
                      });
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: erkek,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Center(
                        child: Text(
                          "E",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        kiz == Color(0xFFF071CD)
                            ? kiz = Color(0xFFF5148E)
                            : kiz = Color(0xFFF071CD);
                      });
                    },
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: kiz,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Center(
                        child: Text(
                          "K",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            textfieldyerleri("kilonuzu girin", 0xFFB2FFE8, "kilo"),
            textfieldyerleri("boyunuzu girin", 0xFF81F04D, "boy"),
            textfieldyerleri("yaşınızı girin", 0xFFFF95A1, "yaş"),
            Padding(
              padding:
                  const EdgeInsets.only(left: 150.0, right: 150.0, top: 5.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    bmi = kilo / ((boy / 100) * (boy / 100));
                    print("bmi=$bmi");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Sayfa2(
                            bmi: bmi,
                          ),
                        ));
                  });
                },
                child: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFE5E5E5),
                  ),
                  child: Center(
                    child: Text("Hesapla"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 55.0, right: 55.0),
              child: Container(
                height: 140.0,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                child: Image.network(
                  "https://www.drhasanerdem.com/wp-content/uploads/2020/01/bmi-onemli-bir-degisken.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  textfieldyerleri(String yazi, int renkkodu, String yer) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30.0,
        right: 30.0,
        bottom: 14.0,
        top: 14.0,
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: yazi,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon: yer == "boy"
              ? Icon(Icons.accessibility)
              : yer == "yaş"
                  ? Icon(Icons.child_care)
                  : Icon(Icons.sports_golf),
          filled: true,
          fillColor: Color(renkkodu),
        ),
        onChanged: (yazi) {
          if (yer == "boy") {
            setState(() {
              boy = int.parse(yazi);
              print("boy$boy");
            });
          } else if (yer == "yaş") {
            setState(() {
              yas = int.parse(yazi);
              print("yaş $yas");
            });
          } else {
            setState(() {
              kilo = int.parse(yazi);
              print("kilo $kilo");
            });
          }
        },
      ),
    );
  }
}
