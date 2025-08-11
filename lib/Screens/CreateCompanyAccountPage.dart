import 'package:flutter/material.dart';
import 'package:test_app/Screens/VerifyAccountPage.dart';

class CreateCompanyAccountPage extends StatefulWidget {
  const CreateCompanyAccountPage({super.key});

  @override
  State<CreateCompanyAccountPage> createState() =>
      _CreateCompanyAccountPageState();
}

class _CreateCompanyAccountPageState extends State<CreateCompanyAccountPage> {
  bool isPhoneSelected = true; // true = Phone, false = Email

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(height: 20),

                // Logo
                Center(
                  child: Text(
                    "Logo",
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Title
                Center(
                  child: Column(
                    children: [
                      const Text(
                        "Create Your Company Account",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // Toggle Buttons
                // Inside your build method, replace the toggle buttons part:

                // Toggle Buttons
                // Toggle Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPhoneSelected = true;
                        });
                      },
                      child: Container(
                        width: 130,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              isPhoneSelected
                                  ? Colors.black87
                                  : Colors.grey[300],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Phone Number',
                            style: TextStyle(
                              color:
                                  isPhoneSelected
                                      ? Colors.white
                                      : Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPhoneSelected = false;
                        });
                      },
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color:
                              !isPhoneSelected
                                  ? Colors.black87
                                  : Colors.grey[300],
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(4),
                            bottomRight: Radius.circular(4),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Email Address',
                            style: TextStyle(
                              color:
                                  !isPhoneSelected
                                      ? Colors.white
                                      : Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Input fields
                if (isPhoneSelected) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Phone',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 6),

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: const [
                            // Bangladesh flag emoji for example
                            Text('🇧🇩', style: TextStyle(fontSize: 24)),
                            SizedBox(width: 6),
                            Text(
                              '+880',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter phone number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                ] else ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Email',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],

                const SizedBox(height: 20),

                // Send OTP Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      String inputValue =
                          isPhoneSelected
                              ? "YourPhoneHere" // You can fetch from controller
                              : "YourEmailHere"; // You can fetch from controller

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => VerifyAccountPage(
                                isPhoneSelected: isPhoneSelected,
                                enteredValue: inputValue,
                              ),
                        ),
                      );
                    },

                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Send OTP"),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Login link
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Go back to login
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Have an account? ',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color:
                              Colors.black, // make sure to set color explicitly
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 80),

                // Beta version text
                Center(
                  child: Text(
                    "Beta Version 1.0",
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
