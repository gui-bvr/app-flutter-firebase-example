// ignore_for_file: prefer_const_constructors, await_only_futures, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyA_ARHRl1IZc5jBhfy25UPsu2NQ-OWWkRk',
      appId: '1:836677915557:android:d8a1e4c4580107a1874e4c',
      messagingSenderId: '836677915557',
      projectId: 'exemplo-7b6c2',
      storageBucket: 'exemplo-7b6c2.appspot.com',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exemplo Firebase',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CollectionReference _exemplo =
      FirebaseFirestore.instance.collection('exemplo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: StreamBuilder(
          stream: _exemplo.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return ListTile(
                    title: Text(
                      documentSnapshot['L6SgaLJkSigiPkUpZ48l'],
                    ),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
