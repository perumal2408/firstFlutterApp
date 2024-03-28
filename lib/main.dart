import 'package:flutter/material.dart';
import 'package:flutter_udemy_project1/detailScreen.dart';

import 'package:flutter_udemy_project1/latest_news.dart';
import 'package:flutter_udemy_project1/subscriptionScreen.dart';
import 'package:flutter_udemy_project1/profileScreen.dart';

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
        title: const Text(
          'The Hindu',
          style: TextStyle(
            color: Colors.white, // Change this to your desired color
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 168, 11, 0),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 168, 11, 0),
              ),
              child: Text(
                'The Hindu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.subscriptions_outlined),
              title: const Text('subscription'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubscriptionScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: const Color.fromARGB(
            255, 255, 255, 255), // This changes the background color
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Image.asset(
                'lib/assets/images/appbanner.jpg',
                fit: BoxFit.cover,
              ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                              firstName: firstName, lastName: lastName),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 10.0,
                  ),
                  child: const Text('Submit'),
                ),
              ),
              LatestNews(),
            ],
          ),
        ),
      ),
    );
  }
}

