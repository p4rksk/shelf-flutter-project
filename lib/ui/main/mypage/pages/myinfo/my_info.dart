
import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          Container(
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
                Text(
                  '닉네임',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 16),

                // Card Info
                TextField(
                  decoration: InputDecoration(
                    labelText: '결제카드',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                // Email
                TextField(
                  decoration: InputDecoration(
                    labelText: '이메일',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                // Password
                TextField(
                  decoration: InputDecoration(
                    labelText: '비번',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16),

                // Confirm Password
                TextField(
                  decoration: InputDecoration(
                    labelText: '비번확인',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16),

                // Phone Number
                TextField(
                  decoration: InputDecoration(
                    labelText: '전화번호',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                // Address
                TextField(
                  decoration: InputDecoration(
                    labelText: '주소',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),

                // Save Button

              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle save action
            },
            child: Text('저장하기'),
          )
        ],
      ),
    );
  }
}
