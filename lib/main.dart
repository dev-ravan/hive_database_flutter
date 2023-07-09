import 'package:flutter/material.dart';
import 'package:hive_database/Model/person_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'Screens/home_page.dart';
import 'contants.dart';

void main() async {
  // Initialize hive
  await Hive.initFlutter();
// Add directory
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  // Registering the adapter
  Hive.registerAdapter(PersonModelAdapter());
  // open the hive box
  box = await Hive.openBox<PersonModel>('peopleBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple[200],
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.blue[300],
            centerTitle: true,
            titleTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
