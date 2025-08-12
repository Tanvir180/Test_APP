import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:test_app/Screens/ProfileCreatingPage.dart';

class ProfileInformationPage extends StatefulWidget {
  const ProfileInformationPage({super.key});

  @override
  _ProfileInformationPageState createState() => _ProfileInformationPageState();
}

class _ProfileInformationPageState extends State<ProfileInformationPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();

  String? selectedGender;
  String? selectedBloodGroup;
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  final List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  void _showBloodGroupModal() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        String? tempSelection = selectedBloodGroup;
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              const Text(
                "Choose",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              const Divider(height: 1),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: bloodGroups.length,
                  itemBuilder: (context, index) {
                    final bg = bloodGroups[index];
                    return RadioListTile<String>(
                      value: bg,
                      groupValue: tempSelection,
                      title: Text(bg),
                      secondary: Image.asset(
                        'icons/Blood.png', // Make sure this path is correct in pubspec.yaml
                        width: 30,
                        height: 30,
                      ),
                      onChanged: (value) {
                        setState(() {
                          tempSelection = value;
                        });
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedBloodGroup = tempSelection;
                        _bloodGroupController.text = tempSelection ?? "";
                      });
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Done",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.black),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back, size: 20),
                    SizedBox(width: 5),
                    Text("Back"),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // Title
              const Center(
                child: Text(
                  "Profile Information",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 4),
              const Divider(thickness: 1),

              const SizedBox(height: 25),
              // Full Name
              TextField(
                controller: _fullNameController,
                decoration: _inputDecoration("Full Name*"),
              ),

              const SizedBox(height: 25),
              // Date of Birth
              TextField(
                controller: _dobController,
                readOnly: true,
                decoration: _inputDecoration(
                  "Date Of Birth*",
                ).copyWith(suffixIcon: const Icon(Icons.calendar_today)),
                onTap: () => _selectDate(context),
              ),

              const SizedBox(height: 25),
              // Gender
              const Text(
                "What Is Your Gender?*",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Radio<String>(
                    value: "Male",
                    groupValue: selectedGender,
                    onChanged:
                        (value) => setState(() => selectedGender = value),
                  ),
                  const Text("Male"),
                  Radio<String>(
                    value: "Female",
                    groupValue: selectedGender,
                    onChanged:
                        (value) => setState(() => selectedGender = value),
                  ),
                  const Text("Female"),
                  Radio<String>(
                    value: "Others",
                    groupValue: selectedGender,
                    onChanged:
                        (value) => setState(() => selectedGender = value),
                  ),
                  const Text("Others"),
                ],
              ),

              const SizedBox(height: 25),
              // Blood Group
              GestureDetector(
                onTap: _showBloodGroupModal,
                child: AbsorbPointer(
                  child: TextField(
                    controller: _bloodGroupController,
                    readOnly: true,
                    decoration: _inputDecoration("Blood Group*").copyWith(
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                      hintText: "Select",
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),
              // Password
              TextField(
                controller: _passwordController,
                obscureText: !passwordVisible,
                decoration: _inputDecoration("Password").copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed:
                        () =>
                            setState(() => passwordVisible = !passwordVisible),
                  ),
                ),
              ),

              const SizedBox(height: 25),
              // Confirm Password
              TextField(
                controller: _confirmPasswordController,
                obscureText: !confirmPasswordVisible,
                decoration: _inputDecoration("Confirm Password").copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(
                      confirmPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed:
                        () => setState(
                          () =>
                              confirmPasswordVisible = !confirmPasswordVisible,
                        ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
              // Next Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileCreatingPage(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 80),
              const Center(
                child: Text(
                  "Beta Version 1.0",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
