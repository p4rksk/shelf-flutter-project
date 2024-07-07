import 'package:flutter/material.dart';
import 'package:untitled/ui/startview/components/sign_up.dart';
import '../../../_core/constants/constants.dart';
import '../../../_core/constants/size.dart';
import '../../../_core/constants/theme.dart';
import '../../main/home/home_page.dart';
import '../../main/main_page.dart';
import '../widgets/show_custom_bottom_sheet.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '로그인',
              style: textTheme().titleLarge?.copyWith(
                color: kAccentColor3,
              ),
            ),
            const SizedBox(height: 40),
            TextFormField(
              cursorColor: TColor.grey,
              decoration: InputDecoration(
                label: const Text('이메일 주소',
                    style: TextStyle(color: Colors.grey)),
                hintText: 'Email을 입력하세요',
                hintStyle: const TextStyle(color: Colors.black26),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: TColor.grey),
                ),
                labelStyle: const TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 25.0),
            TextFormField(
              cursorColor: TColor.grey,
              obscureText: true,
              decoration: InputDecoration(
                label: const Text('Password'),
                hintText: '비밀번호를 입력하세요',
                hintStyle: const TextStyle(color: Colors.black26),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: TColor.grey),
                ),
                labelStyle: const TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 25.0),
            Row(
              // 로그인 정보 기억하기
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Checkbox(
                      value: false,
                      onChanged: null,
                    ),
                    Text(
                      '자동로그인',
                      style: TextStyle(color: Colors.black45),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: TColor.primaryColor1, padding: EdgeInsets.symmetric(horizontal: 16.0),
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kAccentColor1,
                    ),
                  ),
                  child: Text("비밀번호 찾기"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // 기능구현 전 임시로 홈 화면으로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kAccentColor3,
                  foregroundColor: TColor.white,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('로그인'),
              ),
            ),
            const SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  child: Divider(
                    thickness: 0.7,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('또는',
                      style: TextStyle(color: Colors.black45)),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.7,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('계정이 없으신가요? ',
                    style: TextStyle(color: Colors.black45)),
                SizedBox(height: gap_m),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    showCustomBottomSheet(context, "회원가입");
                  },
                  child: const Text('회원가입하기',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kAccentColor3)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}