import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PostsScreen extends StatefulWidget {
  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late Future<List<dynamic>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = fetchPosts();
  }

  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://api.zora.co/graphql'));
    print("hello");
    print(response.body);
    print("hello");
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print("hello");
      print(response.body);
      print("hello");
      final posts =
          jsonResponse['data']; // Adjust based on API response structure
      print(posts);
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zora API Posts'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No posts found'));
          } else {
            return Center(
              child: Text(
                  'Posts fetched successfully. Check console for details.',
                  style: TextStyle(fontSize: 24)),
            );
          }
        },
      ),
    );
  }
}
