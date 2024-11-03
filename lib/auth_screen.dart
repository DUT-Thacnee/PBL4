
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState
();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;
  String _email = '';
  String _password = '';
  String _userType = 'user';

  // Danh sách người dùng (giả định cho mục đích demo)
  final Map<String, String> _users = {};

  void _switchAuthMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _submit() {
    if (_isLogin) {
      // Logic đăng nhập
      if (_users.containsKey(_email) && _users[_email] == _password) {
        // Đăng nhập thành công
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Đăng nhập thất bại
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sai email hoặc mật khẩu.')),
        );
      }
    } else {
      // Logic tạo tài khoản
      if (_users.containsKey(_email)) {
        // Email đã tồn tại
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email đã được sử dụng.')),
        );
      } else {
        // Tạo tài khoản mới
        _users[_email] = _password;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tài khoản đã được tạo.')),
        );
        _switchAuthMode(); // Chuyển sang chế độ đăng nhập
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title
: Text((_isLogin ?? true) ? 'Login' : 'Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) => _email = value,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (value) => _password = value,
            ),
            const SizedBox(height: 16),
            if (!_isLogin)
              DropdownButton<String>(
                value: _userType,
                items: ['user', 'admin'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _userType = newValue!;
                  });
                },
              ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submit,
              child: Text((_isLogin ?? true) ? 'Login' : 'Register'),
            ),
            TextButton(
              onPressed: _switchAuthMode,
              child: Text((_isLogin ?? true)
                  ? 'Create an account'
                  : 'I already have an account'),
            ),
          ],
        ),
      ),
    );
  }
}
