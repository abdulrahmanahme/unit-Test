import 'package:counter_test/model/user_model/user_model.dart';
import 'package:dio/dio.dart';

class UserRepository {
  UserRepository(this.dio);
  final Dio dio;
  Future<List<User>> getUsers() async {
    try {
      var response =
          await dio.get('https://jsonplaceholder.typicode.com/posts?_page');
      if (response.statusCode == 200) {
        return (response.data as List<dynamic>)
            .map((json) => User.fromJson(json))
            .toList();
      } else {
        throw Exception('there an error');
      }
    } catch (error) {
      throw Exception('There was an error: $error');
    }
  }
}
