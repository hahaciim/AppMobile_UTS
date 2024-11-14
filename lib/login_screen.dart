import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'styles.dart';
import 'custom_field.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;

  // Fixed email and password for login validation
  final String validEmail = 'zahra@hisyam.com';
  final String validPassword = 'zahra123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the page background color to white
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyles.title.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: AppColors.darkBlue, // Set AppBar color to blue
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Icon at the top for visual emphasis
              Center(
                child: Icon(
                  Icons.lock_outline,
                  size: 100.0,
                  color: AppColors.darkBlue,
                ),
              ),
              const SizedBox(height: 24.0),
              Text(
                'Welcome!',
                style: TextStyles.title.copyWith(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBlue,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              Text(
                'Please sign in to continue',
                style: TextStyles.body.copyWith(
                  fontSize: 16.0,
                  color: AppColors.darkGrey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32.0),

              // Email field with rounded container
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CustomTextfield(
                  controller: emailController,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  hint: 'Email or Username',
                ),
              ),
              const SizedBox(height: 16.0),

              // Password field with rounded container
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CustomTextfield(
                  controller: passwordController,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  hint: 'Password',
                  isObscure: isObscure,
                  hasSuffix: true,
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10.0),

              // Forgot Password text
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Add forgot password functionality
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyles.body.copyWith(color: AppColors.darkBlue),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),

              // Login Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                onPressed: emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty
                    ? () {
                  // Validate email and password
                  if (emailController.text == validEmail &&
                      passwordController.text == validPassword) {
                    // Navigate to DashboardScreen on successful login
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardScreen()),
                    );
                  } else {
                    // Show error message if login fails
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Email or Password is incorrect'),
                      ),
                    );
                  }
                }
                    : null, // Disable button if fields are empty
                child: Text(
                  'Login',
                  style: TextStyles.title.copyWith(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24.0),

              // Sign Up suggestion
              Center(
                child: Column(
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyles.body.copyWith(
                        fontSize: 18.0,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyles.body.copyWith(
                          fontSize: 18.0,
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
