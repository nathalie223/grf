import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grf/blocs/auth/auth_bloc.dart';
import 'package:grf/main.dart';
import 'package:grf/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            const SizedBox(
              height: 64,
            ),
            const Text(
              "Grf",
              style: TextStyle(
                color: Colors.white,
                fontSize: 64,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            TextField(
              onChanged: (v) {
                setState(() {
                  email = v;
                });
              },
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(CupertinoIcons.phone),
                labelText: "Phone",
                hintText: "Ex:097888654",
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              onChanged: (v) {
                setState(() {
                  password = v;
                });
              },
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(CupertinoIcons.lock),
                labelText: "Password",
              ),
              maxLength: 8,
            ),
            const SizedBox(
              height: 64,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(Login(email, password));
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const RootScreen()));
              },
              child: const Text("connexion"),
            ),
            const SizedBox(
              height: 32,
            ),
            TextButton(
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
              child: const Text(" soit creer un compte"),
            ),
          ],
        ),
      ),
    );
  }
}
