import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trabajoappmoviles/post.dart';

class Data {
  Future<List<Post>> getPost() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(url);

    var posts = List<Post>();

    if (response.statusCode == 200) {
      var postsJson = json.decode(response.body);

      for (var postJson in postsJson) {
        posts.add(Post.fromJson(postJson));
      }
    }
    return posts;
  }
//el metodo de arriba sirve para tomar la informacion de las url de un archivo json y agregarlas al un listado post asincrono
  Future<List<Comment>> getComments(int postId) async {
    var url = 'https://jsonplaceholder.typicode.com/posts/$postId/comments';
    var response = await http.get(url);

    var comments = List<Comment>();

    if (response.statusCode == 200) {
      var commentsJson = json.decode(response.body);

      for (var commentJson in commentsJson) {
        comments.add(Comment.fromJson(commentJson));
      }
    }
    return comments;
  }
}
//este metodo funciona igual que el de arriba pero para poder tomar la informacion de los comentarios