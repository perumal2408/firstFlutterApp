import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String firstName = args['firstName'];

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "Dai $firstName, Mooditu velaya paaru !",
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}