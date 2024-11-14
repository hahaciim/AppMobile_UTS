import 'package:flutter/material.dart';
import 'package:test_app/custom_field.dart';
import 'package:test_app/styles.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final addressController = TextEditingController();
  final dateOfBirthController = TextEditingController();

  bool isObscure = true;
  bool isConfirmObscure = true;

  // Function to show date picker with a white and blue theme
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.darkBlue, // Header background color
              onPrimary: Colors.white, // Header text color
              onSurface: AppColors.darkBlue, // Text color of date
            ),
            dialogBackgroundColor: Colors.white, // Background color of the picker
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        dateOfBirthController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyles.title.copyWith(color: AppColors.darkBlue),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.darkBlue),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Icon(
                  Icons.person_add_alt,
                  size: 80,
                  color: AppColors.darkBlue,
                ),
              ),
              const SizedBox(height: 16.0),
              Center(
                child: Text(
                  'Create Your Account',
                  style: TextStyles.title.copyWith(
                    fontSize: 24.0,
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24.0),

              // Username
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CustomTextfield(
                  controller: usernameController,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  hint: 'Username',
                ),
              ),
              const SizedBox(height: 16.0),

              // Email
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
                  hint: 'Email',
                ),
              ),
              const SizedBox(height: 16.0),

              // Date of Birth with calendar icon
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectDate(context), // Show date picker on tap
                        child: AbsorbPointer(
                          child: CustomTextfield(
                            controller: dateOfBirthController,
                            textInputType: TextInputType.none,
                            textInputAction: TextInputAction.next,
                            hint: 'Date of Birth',
                          ),
                        ),
                      ),
                    ),
                    const Icon(Icons.calendar_today, color: Colors.grey), // Calendar icon
                  ],
                ),
              ),
              const SizedBox(height: 16.0),

              // Address
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CustomTextfield(
                  controller: addressController,
                  textInputType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  hint: 'Address',
                ),
              ),
              const SizedBox(height: 16.0),

              // Password
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CustomTextfield(
                  controller: passwordController,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
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
              const SizedBox(height: 16.0),

              // Confirm Password
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: CustomTextfield(
                  controller: confirmPasswordController,
                  textInputType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  hint: 'Confirm Password',
                  isObscure: isConfirmObscure,
                  hasSuffix: true,
                  onPressed: () {
                    setState(() {
                      isConfirmObscure = !isConfirmObscure;
                    });
                  },
                ),
              ),
              const SizedBox(height: 24.0),

              // Register Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  // Implement your register logic here
                },
                child: Text(
                  'Register',
                  style: TextStyles.title.copyWith(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
