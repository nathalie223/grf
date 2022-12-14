import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grf/blocs/operation/operation_bloc.dart';
import 'package:grf/models/operation.dart';

const List<String> list = <String>[
  'Physiologique',
  'Securitaire',
  'Appartenance',
  'Estime',
  "Accompagnement",
  "Autre"
];

class AddDepasseScreen extends StatefulWidget {
  const AddDepasseScreen({Key? key}) : super(key: key);

  @override
  State<AddDepasseScreen> createState() => _AddDepasseScreenState();
}

class _AddDepasseScreenState extends State<AddDepasseScreen> {
  String libel = "";
  double montant = 0;
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouvelle depasse"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: TextField(
              onChanged: (v) {
                setState(() {
                  montant = double.parse(v);
                });
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Montent",
                prefixIcon: Icon(CupertinoIcons.money_dollar),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 38.0,
              vertical: 10,
            ),
            child: DropdownButtonFormField(
              value: dropdownValue,
              icon: const Icon(CupertinoIcons.arrowtriangle_down),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: TextField(
              onChanged: (v) {
                setState(() {
                  libel = v;
                });
              },
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: "Detail"),
              maxLength: 25,
            ),
          ),
          const SizedBox(
            height: 56,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                var operation = Operation.fromJson(
                  {
                    "montant": montant,
                    "libel": libel,
                    "besoin": dropdownValue,
                    "date": Timestamp.now(),
                    "type": "depense",
                  },
                );
                BlocProvider.of<OperationBloc>(context)
                    .add(AddOpsEvent(operation));
                Navigator.pop(context);
              },
              child: const Text("Enregister"),
            ),
          )
        ],
      ),
    );
  }
}
