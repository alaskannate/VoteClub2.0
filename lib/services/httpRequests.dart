import 'package:http/http.dart' as http;
import 'dart:convert';

class Proposal {
  final String title;
  final String body;

  Proposal({required this.title, required this.body});

  factory Proposal.fromJson(Map<String, dynamic> json) {
    return Proposal(
      title: json['title'],
      body: json['body'],
    );
  }
}

Future<List<Proposal>> fetchData() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  try {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => Proposal.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}




