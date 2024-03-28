import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'dart:convert';

class LatestNews extends StatefulWidget {
  @override
  _LatestNewsState createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  Future<List<String>> fetchNews() async {
    final response = await http
        .get(Uri.parse('https://www.thehindu.com/feeder/default.rss'));
    final xml2json = Xml2Json();
    xml2json.parse(response.body);
    final json = xml2json.toParker();
    final data = jsonDecode(json);
    final items = data['rss']['channel']['item'];
    return items.map<String>((item) => item['title'] as String).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: fetchNews(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: const Row(
                    children: <Widget>[
                      Icon(
                        Icons.newspaper_sharp,
                        color: Color.fromARGB(255, 168, 11, 0),
                      ),
                      SizedBox(
                          width:
                              10), // You can adjust the space between the icon and the text
                      Text(
                        'Latest News Section',
                        style: TextStyle(
                          color: Color.fromARGB(255, 168, 11, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                ...snapshot.data!.take(2).map((title) {
                  return Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 5,
                      ),
                      title: Text(title),
                    ),
                  );
                }).toList(),
                TextButton(
                  child: const Text("Load More"),
                  onPressed: () {
                    // Fetch more news and add them to your list
                  },
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
