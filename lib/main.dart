import 'package:flutter/material.dart';
import 'dart:async'; // Timer를 사용하기 위해 import

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

// 첫 번째 화면 (이미지를 표시하는 화면)
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 3초 후에 로그인 화면으로 전환
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Shape')),
      body: Center(
        child: Image.asset('image/splash.png', width: 200, height: 200), // 이미지 파일 경로 수정
      ),
    );
  }
}

// 로그인 화면
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _autoLogin = false;
  bool _bioAuth = false;
  String? _errorMessage;

  void _login() {
    setState(() {
      _errorMessage = null; // 초기화
    });

    // 예시: 간단한 유효성 검사
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _errorMessage = '이메일 또는 비밀번호를 입력하세요.';
      });
    } else {
      // 실제 로그인 로직은 여기에 추가
      print('로그인 시도: ${_emailController.text}, 비밀번호: ${_passwordController.text}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('로그인')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 이메일 또는 전화번호 입력 필드 위에 이미지 추가
            Image.asset('image/splash.png', width: 100, height: 100), // 이미지 파일 경로 수정
            SizedBox(height: 16),
            // 이메일 또는 전화번호 입력 필드
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: '이메일 또는 전화번호', // ①
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            // 비밀번호 입력 필드
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: '비밀번호', // ②
                border: OutlineInputBorder(),
                errorText: _errorMessage, // 오류 메시지 표시
              ),
            ),
            // 체크박스와 텍스트
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // 오른쪽 정렬
              children: [
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value!;
                    });
                  },
                ),
                Text('아이디 기억하기'), // ③
              ],
            ),
            // 자동 로그인 체크박스
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // 오른쪽 정렬
              children: [
                Transform.translate(
                  offset: Offset(-26.0, 0), // 왼쪽으로 0.1mm 이동
                  child: Checkbox(
                    value: _autoLogin,
                    onChanged: (value) {
                      setState(() {
                        _autoLogin = value!;
                      });
                    },
                  ),
                ),
                Transform.translate(
                  offset: Offset(-26.0, 0), // 텍스트도 왼쪽으로 0.1mm 이동
                  child: Text('자동 로그인'), // ④
                ),
              ],
            ),
            // 생체 인증 로그인 체크박스
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // 오른쪽 정렬
              children: [
                Checkbox(
                  value: _bioAuth,
                  onChanged: (value) {
                    setState(() {
                      _bioAuth = value!;
                    });
                  },
                ),
                Text('생체인증 로그인'), // ⑤
              ],
            ),
            // 로그인 버튼
            SizedBox(
              width: double.infinity, // 입력 필드와 같은 너비로 설정
              child: ElevatedButton(
                onPressed: _login,
                child: Text('로그인'), // ⑥
              ),
            ),
            SizedBox(height: 16),
            // QR 로그인 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // 오른쪽 정렬
              children: [
                TextButton(
                  onPressed: () {
                    // QR 로그인 기능 추가
                  },
                  child: Text('QR 로그인'), // ⑦
                ),
              ],
            ),
            SizedBox(height: 16),
            // Spacer를 추가하여 "문의하기"를 아래로 이동
            Spacer(),
            // 연락처 정보 (맨 아래로 이동)
            Text(
              '문의하기: 02-1234-5678', // ⑧
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}