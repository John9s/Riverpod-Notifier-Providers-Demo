import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_notifiers_demo/statenotifier_page.dart';

import 'changenotifier_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
          title: 'RiverPod Notifiers',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Home()),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RiverPod Notifier Providers"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric( vertical: 30.0, horizontal: 40.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [

          const Text("This app demonstrates the use of the two Provider categories of the Riverpod Notifier Provider", style: TextStyle(fontSize: 18.0,wordSpacing: 2.0)),

          SizedBox(height: 50.0),

          SizedBox(
            width: double.infinity,

            child: ElevatedButton(
                child: const Text("ChangeNotifier"),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChangeNotifierPage()))),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                child: const Text("StateNotifier"),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StateNotifierPage()))),
          ),
        ]),
      ),
    );
  }
}
