import 'package:flutter/material.dart';
import 'package:huhu/ui/beranda.dart';
// ignore: unused_import
import 'ui/beranda.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final String validUsername = 'fairuz123';
  final String validPassword = 'fairuz123';

  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulasi delay untuk login
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      String username = _usernameCtrl.text;
      String password = _passwordCtrl.text;

      if (username == validUsername && password == validPassword) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Beranda()),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Login Gagal'),
              content: const Text('Username atau Password Salah.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/asset/logo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScaleTransition(
                      scale: _animation,
                      child: const Text(
                        "Login user",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ScaleTransition(
                      scale: _animation,
                      child: Image.asset(
                        'lib/asset/logo.png', // Path gambar logo
                        height: 150, // Sesuaikan ukuran gambar
                      ),
                    ),
                    const SizedBox(height: 50),
                    FadeTransition(
                      opacity: _animation,
                      child: Center(
                        child: Form(
                          key: _formKey,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: Column(
                              children: [
                                _usernameTextField(),
                                const SizedBox(height: 20),
                                _passwordTextField(),
                                const SizedBox(height: 40),
                                _tombolLogin(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black54,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _usernameTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Username"),
      controller: _usernameCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Username tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Password"),
      obscureText: true,
      controller: _passwordCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _tombolLogin() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: const Text("Login"),
        onPressed: _login,
      ),
    );
  }
}
