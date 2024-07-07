import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // For Riverpod state management
import 'package:untitled/_core/constants/size.dart';
import 'package:untitled/ui/startview/components/sign_in.dart';
import '../../../_core/constants/constants.dart';
import '../../../_core/constants/theme.dart';
import '../../../data/store/checkbox.dart';
import '../widgets/show_custom_bottom_sheet.dart';

class SignUp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '회원가입',
              style: textTheme().titleLarge?.copyWith(
                color: kAccentColor3,
              ),
            ),
            const SizedBox(height: 40.0),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    cursorColor: TColor.grey,
                    decoration: InputDecoration(
                      label: const Text('이메일', style: TextStyle(color: Colors.grey)),
                      hintText: '이메일를 입력하세요',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: TColor.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: kAccentColor3,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('중복 확인'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25.0),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    cursorColor: TColor.grey,
                    decoration: InputDecoration(
                      label: const Text('닉네임', style: TextStyle(color: Colors.grey)),
                      hintText: '닉네임을 입력하세요',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: TColor.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: kAccentColor3,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('중복 확인'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25.0),
            TextFormField(
              cursorColor: TColor.grey,
              obscureText: true,
              decoration: InputDecoration(
                label: const Text('비밀번호', style: TextStyle(color: Colors.grey)),
                hintText: '비밀번호를 입력하세요',
                hintStyle: const TextStyle(color: Colors.black26),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: TColor.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            TextFormField(
              cursorColor: TColor.grey,
              obscureText: true,
              decoration: InputDecoration(
                label: const Text('비밀번호 확인', style: TextStyle(color: Colors.grey)),
                hintText: '비밀번호를 다시 입력하세요',
                hintStyle: const TextStyle(color: Colors.black26),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: TColor.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            Row(
              children: [
                Checkbox(
                  value: ref.watch(CheckedBoxProvider),
                  onChanged: (bool? value) {
                    ref.read(CheckedBoxProvider.notifier).state = value!;
                  },
                  activeColor: kAccentColor3,
                  checkColor: TColor.white,
                ),
                GestureDetector(
                  onTap: () => _showPrivacyPolicyDialog(context),
                  child: const Text(
                    '개인정보 처리 방침',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kAccentColor3,
                    ),
                  ),
                ),
                const Text(
                  '에 동의합니다',
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kAccentColor3,
                      foregroundColor: TColor.white,
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('회원가입하기'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    thickness: 0.7,
                    color: TColor.grey.withOpacity(0.5),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '또는',
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 0.7,
                    color: TColor.grey.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '이미 계정이 있으신가요? ',
                  style: TextStyle(color: Colors.black45),
                ),
                SizedBox(height: gap_m),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    showCustomBottomSheet(context, "로그인");
                  },
                  child: const Text(
                    '로그인하기',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kAccentColor3,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showPrivacyPolicyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("개인정보 처리방침"),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text("1. 개인정보의 수집 및 이용 목적"),
              Text("본 앱은 서비스 제공을 위해 다음과 같은 개인정보를 수집하고 있습니다."),
              Text(" - 이름, 연락처, 이메일, 생년월일 등"),
              Text("2. 개인정보의 보유 및 이용 기간"),
              Text("귀하의 개인정보는 서비스 이용기간 동안 보유하며, 목적 달성 후 즉시 파기합니다."),
              Text("3. 개인정보의 파기 절차 및 방법"),
              Text("사용자의 개인정보는 목적이 달성된 후 내부 방침 및 관련 법률에 따라 안전하게 파기됩니다."),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("닫기", style: TextStyle(color: kAccentColor2)),
          ),
        ],
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
