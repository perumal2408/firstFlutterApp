import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String firstName;
  final String lastName;

  DetailScreen({required this.firstName, required this.lastName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Text('Hey $firstName!, Welcome'),
      ),
    );
  }
}
