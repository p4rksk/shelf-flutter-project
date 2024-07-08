import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            // Profile Image
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  'assets/profile_picture.png'), // Replace with your image asset
            ),
            SizedBox(height: 16),

            // Nickname
            Text(
              '닉네임',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
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
            ElevatedButton(
              onPressed: () {
                // Handle save action
              },
              child: Text('저장하기'),
            ),
          ],
        ),
      ),
    );
  }
}
//
// import 'package:flutter/material.dart';
//
// class MyPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Page'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // Profile Image
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: AssetImage('assets/profile_picture.png'), // Replace with your image asset
//               ),
//               SizedBox(height: 16),
//
//               // Nickname
//               Text(
//                 '닉네임',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 16),
//
//               // Card Info
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: '결제카드',
//                   hintText: '카드번호 ..1234',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//
//               // Email
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: '이메일',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//
//               // Password
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: '비번',
//                   border: OutlineInputBorder(),
//                 ),
//                 obscureText: true,
//               ),
//               SizedBox(height: 16),
//
//               // Confirm Password
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: '비번확인',
//                   border: OutlineInputBorder(),
//                 ),
//                 obscureText: true,
//               ),
//               SizedBox(height: 16),
//
//               // Phone Number
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: '전화번호',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//
//               // Address
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: '주소',
//                   hintText: '(도움말)',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               SizedBox(height: 16),
//
//               // Save Button
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle save action
//                 },
//                 child: Text('저장하기'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: MyPage(),
//   ));
// }
