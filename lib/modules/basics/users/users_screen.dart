import 'package:flutter/material.dart';
import 'package:udemy_project/models/user/user_model.dart';

class UsersScreen extends StatelessWidget{
  List<UserModel> users = [
    UserModel(id: 1, name: 'Alaa', phone: '+2036'),
    UserModel(id: 2, name: 'Ali', phone: '+20378'),
    UserModel(id: 3, name: 'Ahmed', phone: '+20378'),
    UserModel(id: 4, name: 'Samy', phone: '+20378'),
    UserModel(id: 5, name: 'Khaled', phone: '+20378'),
    UserModel(id: 6, name: 'Fathy', phone: '+20378'),
    UserModel(id: 7, name: 'Enas', phone: '+20378'),
    UserModel(id: 8, name: 'Mohamed', phone: '+20378'),
    UserModel(id: 9, name: 'Yomna', phone: '+20378'),
    UserModel(id: 10, name: 'Emily', phone: '+20378'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users',
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(users[index]),
          separatorBuilder: (context, index) => Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
          itemCount: users.length),
    );
  }

  Widget buildUserItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          child: Text(
            '${user.id}',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${user.phone}',
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    ),
  );

}