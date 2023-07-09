import 'package:flutter/material.dart';
import 'package:hive_database/Model/person_model.dart';
import 'package:hive_database/myWidgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../contants.dart';

class PersonList extends StatefulWidget {
  const PersonList({super.key});

  @override
  State<PersonList> createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  @override
  void initState() {
    box = Hive.box<PersonModel>('peopleBox');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("H I V E    D A T A B A S E"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: box.length,
                itemBuilder: (context, i) {
                  PersonModel personData = box.getAt(i)!;

                  return listTile(
                      name: personData.name,
                      color: personData.favColor,
                      age: personData.age,
                      onTap: () {
                        setState(() {
                          box.deleteAt(i);
                        });
                      });
                })
          ],
        ),
      ),
    );
  }
}
