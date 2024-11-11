import 'package:flutter/material.dart';
import 'package:loginpage/button.dart';
import 'package:loginpage/textForm.dart';
import 'package:loginpage/tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {
    // Implement your own sign-in logic here.
    // For example, you can check the entered credentials against a local list or API.
    print(
        'Signed in with email: ${emailController.text} and password: ${passwordController.text}');
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
                  Icons.lock,
                  color: Color.fromARGB(255, 126, 126, 126),
                  size: 100,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Welcome back you have been missed',
                ),
                const SizedBox(
                  height: 25,
                ),
                MyTextField(
                    controller: emailController,
                    hintText: "Username",
                    obscureText: false),
                const SizedBox(
                  height: 25,
                ),
                MyTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password ?",
                        style:
                            TextStyle(color: Color.fromARGB(255, 88, 88, 88)),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                MyButton(
                  onTap: signUserIn,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          indent: 25,
                          thickness: 0.5,
                          color: Color.fromARGB(255, 146, 143, 143),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Color.fromARGB(255, 146, 143, 143),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Tiles(imagePath: 'lib/images/google.png'),
                    SizedBox(
                      width: 20, // Adjust the width as needed
                    ),
                    Tiles(imagePath: 'lib/images/apple.png'),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member ? ",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text(
                      "Register now",
                      style: TextStyle(
                        color: Color.fromARGB(255, 48, 48, 48),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
