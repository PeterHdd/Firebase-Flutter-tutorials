import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_start_tutorial/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Start',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Firebase Realtime Database'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final fb = FirebaseDatabase.instance;
  final myController = TextEditingController();
  final name = "Name";
  var retrievedName;

  @override
  Widget build(BuildContext context) {
    final ref = fb.ref();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: Container(
            child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(name),
                SizedBox(width: 20),
                Expanded(child: TextField(controller: myController)),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                ref.child(name).set(myController.text);
              },
              child: Text("Submit"),
            ),
            ElevatedButton(
              onPressed: () {
                ref.child("Name").once().then((DatabaseEvent data) {
                  print(data.snapshot.key);
                  print(data.snapshot.value);
                  setState(() {
                    retrievedName = data.snapshot.value;
                  });
                });
              },
              child: Text("Get"),
            ),
            Text(retrievedName ?? ""),
          ],
        )));
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
}
