import 'package:counter_test/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UserRepository {
  UserRepository(this.client);
  final http.Client client;
  Future<List<User>> getUsers() async {
    print('sssssssssaaa');
    try {
      var response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts?_page'));
      if (response.statusCode == 200) {
        var convertBody =
            convert.jsonDecode(response.body) as List<dynamic>;
        return convertBody.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('there an error');
      }
    } catch (error) {
      throw Exception('There was an error: $error');
    }
  }
}
