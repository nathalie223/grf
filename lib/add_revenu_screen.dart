import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grf/blocs/operation/operation_bloc.dart';
import 'package:grf/models/operation.dart';

class AddRevenuScreen extends StatefulWidget {
  const AddRevenuScreen({Key? key}) : super(key: key);

  @override
  State<AddRevenuScreen> createState() => _AddRevenuScreenState();
}

class _AddRevenuScreenState extends State<AddRevenuScreen> {
  String libel = "";
  double montant = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouveau revenu"),
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
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: TextField(
              onChanged: (v) {
                setState(() {
                  libel = v;
                });
              },
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: "Libel"),
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
                    "date": Timestamp.now(),
                    "type": "revenu",
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
