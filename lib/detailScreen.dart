import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String firstName;
  final String lastName;

  DetailScreen({required this.firstName, required this.lastName});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final myController = TextEditingController();
  final List<String> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Center(
              child: Text('Hey ${widget.firstName}!, Welcome'),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: myController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Add Notes',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  color: Colors.blue,
                  onPressed: () {
                    setState(() {
                      notes.add(myController.text);
                      myController.clear();
                    });
                  },
                ),
              ],
            ),
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: notes.map((note) {
                return TableRow(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(
                          4.0), // This adds space around the container
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black), // This adds a black border
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          note,
                          style:const TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
