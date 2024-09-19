import 'package:counter_test/user_model.dart';
import 'package:counter_test/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserListState();
}

class _UserListState extends State<UserScreen> {
  UserRepository userRepertory = UserRepository(Client());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<User>>(
          future: userRepertory.getUsers(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              
              return Container(
                child: Center(child:  Text('please try again ${snapshot.error}')),
              );
            } else if (snapshot.hasData) {
              final users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(users[index].title),
                    subtitle: Text('ID: ${users[index].id}'),
                  );
                },
              );
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }
}
