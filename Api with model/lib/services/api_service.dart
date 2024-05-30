import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newpro/models/post_model.dart';

class ApiService {
  Future<List<PostModel>> getPosts() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      List<PostModel> postsData = []; // Initialize postsData here
      for (var eachMap in responseBody) {
        postsData.add(PostModel.fromJson(eachMap));
      }
      return postsData; // Return postsData after the loop
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
