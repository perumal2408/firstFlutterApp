import 'package:flutter/material.dart';
import 'package:flutter_udemy_project1/detailScreen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Nav2App(),
    ),
  );
}

class Nav2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => MyHomePage(),
        // '/details': (context) => DetailScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation Home Page'),
        backgroundColor: Colors.blue, // This changes the AppBar color
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color.fromARGB(255, 49, 49, 49),Color.fromARGB(255, 0, 0, 0)],
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your first name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your last name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String firstName = _firstNameController.text;
                      String lastName = _lastNameController.text;
                      Navigator.pushNamed(
                        context,
                        '/details',
                        arguments: {'firstName': firstName, 'lastName': lastName},
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10.0,
                  ),
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}