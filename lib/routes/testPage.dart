import 'package:flutter/material.dart';
import 'package:flutter_portfolio/forms/userForm.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/testsAlbumsPostsUsers.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/2'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class MyTest extends StatefulWidget {
  const MyTest({super.key});

  @override
  State<MyTest> createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
           
            const Text("Test Form"),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              child: UserForm(),
            ),
            const Text("Test Data"),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child:  FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.title);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
            ),
            TextButton(onPressed: () => {}, child: const Text('Test'))
          ],
        ),
      ),
    );
  }
}
