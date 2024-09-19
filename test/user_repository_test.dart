import 'package:counter_test/app_const.dart';
import 'package:counter_test/user_model.dart';
import 'package:counter_test/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class ClientHTTPMock extends Mock implements Client {}

void main() {
  late UserRepository userRepertory;
  late ClientHTTPMock clientHTTPMock;
  late AppConst appConst;

  setUp(() {
    clientHTTPMock = ClientHTTPMock();
    userRepertory = UserRepository(clientHTTPMock);
    appConst = AppConst();
  });

  group('Test UserRepository class ', () {
    test(
        'Test getUsers function in  UserRepository class should return a status code 200',
        () async {
      ///Arrange

      ///Act
      when(
        () => clientHTTPMock.get(
          Uri.parse(
            'https://jsonplaceholder.typicode.com/posts?_page',
          ),
        ),
      ).thenAnswer(
        (invocation) async {
          return Response(appConst.responseSuccess, 200);
        },
      );

      var user = await userRepertory.getUsers();

      /// Asset
      expect(user, isA<List<User>>());
    });

  });
}
