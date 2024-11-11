import 'package:flutter/material.dart';
import 'package:loginpage/button.dart';
import 'package:loginpage/textForm.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void registerUser() {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Simulate registration logic (for example, local validation or API call)
    Future.delayed(const Duration(seconds: 2), () {
      if (passwordController.text == confirmPasswordController.text) {
        Navigator.pop(context); // Pop the loading indicator
        Navigator.pop(context, true); // Pop the register page and return true
      } else {
        Navigator.pop(context); // Pop the loading indicator
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text('Passwords do not match'),
              content: Text('Please ensure the passwords match.'),
            );
          },
        );
      }
    });
  }

  void showErrorMessage(String? message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message ?? 'An unknown error occurred.'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 209, 209),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 25),
                const Icon(
                  Icons.person_add,
                  color: Color.fromARGB(255, 126, 126, 126),
                  size: 100,
                ),
                const SizedBox(height: 25),
                const Text(
                  'Create a new account',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                MyButton(
                  onTap: registerUser,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          color: Color.fromARGB(255, 48, 48, 48),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
