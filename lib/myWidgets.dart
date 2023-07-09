import 'package:flutter/material.dart';

Widget listTile(
    {required String name,
    required String color,
    required int age,
    required Function onTap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: ListTile(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.blue, width: 4),
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Row(
        children: [
          Text("Age: $age"),
          const SizedBox(
            width: 20,
          ),
          Text("Favorite Color: $color"),
        ],
      ),
      trailing: IconButton(
        onPressed: onTap as void Function(),
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    ),
  );
}

Widget commonTextfield(
    {required TextEditingController controller,
    required String label,
    Key? key}) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 20,
      left: 15,
      right: 15,
    ),
    child: TextFormField(
      controller: controller,
      key: key,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          fillColor: Colors.white,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.black,
              )),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.black,
            ),
          ),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black)),
    ),
  );
}

Widget customButton({
  required BuildContext context,
  required double height,
  required String title,
  required Function onTap,
}) {
  return InkWell(
    onTap: onTap as void Function(),
    child: Padding(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Container(
        height: MediaQuery.of(context).size.height / height,
        // height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.blue[300]),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 15),
        )),
      ),
    ),
  );
}
