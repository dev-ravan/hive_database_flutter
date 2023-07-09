import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database/Model/person_model.dart';
import 'package:hive_database/Screens/person_list.dart';

import '../contants.dart';
import '../myWidgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final favColorController = TextEditingController();
// used for hive

  @override
  void initState() {
    // Get reference to an already opened box
    box = Hive.box<PersonModel>('peopleBox');
    super.initState();
  }

  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
    super.dispose();
  }

  // ---------------------------------------

  _addInfo() async {
    // Add info to people box
    PersonModel newPerson = PersonModel(
        name: nameController.text,
        age: int.parse(ageController.text),
        favColor: favColorController.text);
    box.add(newPerson);
    print('Info added to box!');
  }

  _getInfo() {
    // Get info from people box
  }

  _updateInfo() {
    // Update info of people box
  }

  _deleteInfo() {
    // Delete info from people box
  }
  // ----------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("H I V E    D A T A B A S E"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  Image.asset("assets/Logo.png", height: 300),
                  commonTextfield(
                    controller: nameController,
                    label: "Name",
                  ),
                  commonTextfield(
                    controller: ageController,
                    label: "Age",
                  ),
                  commonTextfield(
                    controller: favColorController,
                    label: "Favorite Color",
                  ),
                ]),
              ),
            ),
            customButton(
                context: context,
                height: 15,
                onTap: () {
                  _addInfo();

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PersonList()));
                },
                title: "S U B M I T")
          ],
        ),
      ),
    );
  }
}
