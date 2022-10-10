import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Directory document = await getApplicationDocumentsDirectory();

  Hive.init(document.path);

  await Hive.openBox("students");

  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Box? studentBox;
  @override
  void initState() {
    studentBox = Hive.box("students");
    super.initState();
  }

  TextEditingController rollno = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController father = TextEditingController();
  TextEditingController depart = TextEditingController();
  TextEditingController year = TextEditingController();
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Hive DataBase"),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: new Text("Welcome!"),
                            content: SingleChildScrollView(
                              child: Container(
                                height: 300,
                                child: Column(children: [
                                  TextField(
                                      controller: rollno,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.teal),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        labelText: 'Roll number',
                                        labelStyle:
                                            new TextStyle(color: Colors.teal),
                                      )),
                                  TextField(
                                      controller: name,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.teal),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        labelText: ' Name',
                                        labelStyle:
                                            new TextStyle(color: Colors.teal),
                                      )),
                                  TextField(
                                      controller: father,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.teal),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        labelText: ' Fathers Name',
                                        labelStyle:
                                            new TextStyle(color: Colors.teal),
                                      )),
                                  TextField(
                                      controller: depart,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.teal),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        labelText: 'Department',
                                        labelStyle:
                                            new TextStyle(color: Colors.teal),
                                      )),
                                  TextField(
                                      controller: year,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.teal),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        labelText: 'Year',
                                        labelStyle:
                                            new TextStyle(color: Colors.teal),
                                      )),
                                ]),
                              ),
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                  onPressed: () {
                                    studentBox?.put(rollno.text, name.text);
                                    rollno.clear();
                                    name.clear();
                                    father.clear();
                                    depart.clear();
                                    year.clear();
                                    Navigator.of(context).pop();
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.amber),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(horizontal: 70)),
                                      textStyle: MaterialStateProperty.all(
                                          TextStyle(fontSize: 20))),
                                  child: Text("Add"))
                            ],
                          );
                        },
                      );
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 100)),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 20))),
                    child: Text("Add")),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 100)),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 20))),
                    child: Text("Show")),
                ValueListenableBuilder(
                    valueListenable: studentBox!.listenable(),
                    builder: (context, Box studentBox, _) {
                      return Expanded(
                          child: ListView.builder(
                              itemCount: studentBox.keys.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(studentBox.keyAt(index)),
                                  subtitle: Text(studentBox.getAt(index)),
                                  trailing: Row(
                                    children: [
                                      GestureDetector(
                                        child: Icon(Icons.update),
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: new Text("update!"),
                                                content: SingleChildScrollView(
                                                  child: Container(
                                                    height: 300,
                                                    child: Column(children: [
                                                      TextField(
                                                          controller: rollno,
                                                          decoration:
                                                              InputDecoration(
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .teal),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            labelText:
                                                                'Roll number',
                                                            labelStyle:
                                                                new TextStyle(
                                                                    color: Colors
                                                                        .teal),
                                                          )),
                                                      TextField(
                                                          controller: name,
                                                          decoration:
                                                              InputDecoration(
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                      color: Colors
                                                                          .teal),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
                                                            ),
                                                            labelText: ' Name',
                                                            labelStyle:
                                                                new TextStyle(
                                                                    color: Colors
                                                                        .teal),
                                                          )),
                                                    ]),
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        studentBox.put(
                                                            studentBox.keyAt(index),
                                                            name.text);
                                                        rollno.clear();
                                                        name.clear();
                                                        father.clear();
                                                        depart.clear();
                                                        year.clear();    
                                                      },
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                                      Colors.amber),
                                                          padding:
                                                              MaterialStateProperty
                                                                  .all(EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              70)),
                                                          textStyle:
                                                              MaterialStateProperty
                                                                  .all(TextStyle(
                                                                      fontSize:
                                                                          20))),
                                                      child: Text("update"))
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              }));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
