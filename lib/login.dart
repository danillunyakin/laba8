
import 'package:flutter/material.dart';
import 'signup.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 80),

                  Icon(
                    Icons.account_circle,
                    size: 80,
                    color: Theme.of(context).colorScheme.primary,
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _loginController,
                    decoration: const InputDecoration(
                      labelText: 'Login',
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter your login';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your password';
                      }
                      if (value.length < 6) {
                        return 'Minimum 6 characters';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Text('Message'),
                              content: Text('Need to implement'),
                            );
                          },
                        );
                      }
                    },
                    child: const Text('Login'),
                  ),

                  const SizedBox(height: 10),

                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const SignupScreen(),
                        ),
                      );
                    },
                    child: const Text('Sign up'),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: const Text('Forgot password?'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
