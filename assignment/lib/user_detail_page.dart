import 'package:flutter/material.dart';

class UserDetailPage extends StatelessWidget {
  final Map<String, dynamic> user;

  UserDetailPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: Text('${user['first_name']} ${user['last_name']}',),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child:
        
          Hero(
            tag: 'cards',
            child: Image.network(
              user['avatar'],
              fit: BoxFit.cover,
              height: 400, 
            ),
          ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
            child:Column(
              children: [
                Text(
              'Employee ID: ${user['id']}',
              style: TextStyle(fontSize: 16),
            ),
                SizedBox(height: 8.0),
                Text(
                  user['email'] ?? '',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            ),
            ),
        ],
      ),
    );
  }
}
