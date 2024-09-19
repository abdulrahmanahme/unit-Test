import 'package:counter_test/app_const.dart';
import 'package:counter_test/user_model.dart';
import 'package:counter_test/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'user_repository_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late UserRepository userRepertory;
  late MockDio mockDio;
  late AppConst appConst;

  setUp(() {
    mockDio = MockDio();
    userRepertory = UserRepository(mockDio);
    appConst = AppConst();
  });

  group('Test UserRepository class ', () {
    test(
        'Test getUsers function in  UserRepository class should return a status code 200',
        () async {
      ///Arrange
      ///Act
      when(
        mockDio.get('https://jsonplaceholder.typicode.com/posts?_page'),
      ).thenAnswer(
        (_) async => Response(
          data: [
            {
              "userId": 1,
              "id": 1,
              "title":
                  "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
              "body":
                  "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
            },
            {
              "userId": 1,
              "id": 2,
              "title": "qui est esse",
              "body":
                  "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
            },
            {
              "userId": 1,
              "id": 3,
              "title":
                  "ea molestias quasi exercitationem repellat qui ipsa sit aut",
              "body":
                  "et iusto sed quo iure\nvoluptatem occaecati omnis eligendi aut ad\nvoluptatem doloribus vel accusantium quis pariatur\nmolestiae porro eius odio et labore et velit aut"
            },
          ],
          statusCode: 200,
          requestOptions: RequestOptions(
              path: 'https://jsonplaceholder.typicode.com/posts?_page'),
        ),
      );

      var user = await userRepertory.getUsers();

      /// Asset
      expect(user, isA<List<User>>());
    });
  });

  test(
      'Test getUsers function in  UserRepository class should return a status code 500',
      () async {
    //Arrange
    //Act
    when(
      mockDio.get('https://jsonplaceholder.typicode.com/posts?_page'),
    ).thenThrow(
      (_) async => DioException(
         response: Response(
            statusCode: 500,
            requestOptions: RequestOptions(path:'https://jsonplaceholder.typicode.com/posts?_page'),
          ),
        requestOptions: RequestOptions(
          path: 'https://jsonplaceholder.typicode.com/posts?_page',
        ),
      ),
    );
    var user = userRepertory.getUsers();

    /// Asset
    expect(user,  throwsA(isInstanceOf<Exception>()));
  });
}
