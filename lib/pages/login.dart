import 'package:adoptpet/buttomMenu.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(25),
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            Color.fromARGB(255, 72, 195, 239),
            Color.fromARGB(255, 208, 71, 196),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),

          // Welcome
          Text(
            'Welcome Back!',
            style: GoogleFonts.shantellSans(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Form
          Form(
            key: _formKey,
            child: Column(
              children: [
                // ID
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'EMAIL',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    prefixIcon: const Icon(Icons.email),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 80,
                    ),
                  ),
                  validator: (value) => value!.isEmpty
                      ? 'Please enter your email'
                      : !value.contains('@')
                          ? 'Email is invalid'
                          : null,
                ),
                const SizedBox(
                  height: 20,
                ),

                // Password
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'PASSWORD',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    prefixIcon: const Icon(Icons.lock),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 80,
                    ),
                  ),
                  validator: (value) => value!.isEmpty
                      ? 'Please enter your password'
                      : value.length < 6
                          ? 'Password must be at least 6 characters'
                          : null,
                ),

                const SizedBox(
                  height: 40,
                ),

                // Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Email: $email, Password: $password',
                              style: GoogleFonts.notoSans(
                                color: Colors.white,
                              )),
                        ),
                      );
                      Get.to(() => const MyMenu());
                    }
                  },
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 56, 56, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    minimumSize: const Size(double.maxFinite, 60),
                    shadowColor: Colors.black,
                    elevation: 8,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // check box
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        Text(
                          'Remember me',
                          style: GoogleFonts.notoSans(
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: GoogleFonts.notoSans(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                // Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: GoogleFonts.notoSans(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                      child: Text(
                        'Register',
                        style: GoogleFonts.notoSans(
                          color: const Color.fromARGB(255, 18, 0, 118),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
