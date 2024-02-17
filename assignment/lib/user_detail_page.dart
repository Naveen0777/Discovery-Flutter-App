import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  final Map<String, dynamic> user;

  UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('${user['first_name']} ${user['last_name']}',),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child:
        Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user['avatar']),
              radius: 50,
            ),
            SizedBox(height: 20.0),
            Text(
              'Employee ID: ${user['id']}',
              style: TextStyle(fontSize: 16),
            ),
            // SizedBox(height: 20),
            // Text(
            //   '${user['first_name']} ${user['last_name']}',
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: 5.0),
            Text(
              'Email: ${user['email']}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10.0),
            
          ],
        ),
        ),
      ),
    );
  }
}
