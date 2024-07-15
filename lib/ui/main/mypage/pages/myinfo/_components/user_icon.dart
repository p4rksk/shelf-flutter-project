import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/style.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({
    super.key,
    required this.username,
  });

  final String? username;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/icon/03.png'), // Replace with your image asset
            ),
          ),
          SizedBox(height: 10),
          Text(
            '${username} 님',
            style: h5(),
          )
        ],
      ),
    );
  }
}
