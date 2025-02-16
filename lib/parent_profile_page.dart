import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ParentProfilePage extends StatefulWidget {
  const ParentProfilePage({super.key});

  @override
  _ParentProfilePageState createState() => _ParentProfilePageState();
}

class _ParentProfilePageState extends State<ParentProfilePage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneCodeController =
      TextEditingController(text: '+251');
  final TextEditingController phoneNumberController = TextEditingController();

  String familyType = 'Father';
  String dateOfBirth = 'Select';
  String location = 'Select';
  String numberOfChildren = 'Select';

  bool isLoading = false;
  File? _profileImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4E6FF),
      appBar: AppBar(
        backgroundColor: Color(0xFFF4E6FF),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'My Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: _profileImage != null
                              ? FileImage(_profileImage!)
                              : AssetImage('assets/profile_picture.jpg')
                                  as ImageProvider,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.camera_alt, color: Colors.blue),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SafeArea(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading: Icon(Icons.photo_library),
                                          title: Text('Choose from Gallery'),
                                          onTap: () {
                                            _pickImage(ImageSource.gallery);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.camera_alt),
                                          title: Text('Take a Photo'),
                                          onTap: () {
                                            _pickImage(ImageSource.camera);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hermela Gizaw',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          familyType,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bio: hardworking, patient with kids with difficult behavior, equipped with teaching experience at elementary schools',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Post'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      buildTextField('Full Name', fullNameController),
                      buildDropdownField('Family Type', familyType,
                          ['Father', 'Mother', 'Guardian'], (newValue) {
                        setState(() {
                          familyType = newValue!;
                        });
                      }),
                      buildTextField('Email', emailController),
                      buildPhoneNumberField('Phone Number', phoneCodeController,
                          phoneNumberController),
                      buildDatePickerField('Date of Birth', dateOfBirth,
                          (selectedDate) {
                        setState(() {
                          dateOfBirth = selectedDate;
                        });
                      }),
                      buildDropdownField('Location', location, [
                        'Select',
                        'Addis Ababa',
                        'Nairobi',
                        'Moyale'
                      ], (newValue) {
                        setState(() {
                          location = newValue!;
                        });
                      }),
                      buildDropdownField('Number of Children', numberOfChildren,
                          ['Select', '1', '2', '3', '4+'], (newValue) {
                        setState(() {
                          numberOfChildren = newValue!;
                        });
                      }),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: isLoading ? null : saveProfile,
                    child: isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text('Save'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget buildDropdownField(String label, String value, List<String> options,
      ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            items: options.map((option) {
              return DropdownMenuItem(
                child: Text(option),
                value: option,
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }

  Widget buildDatePickerField(
      String label, String selectedDate, ValueChanged<String> onDateSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          onDateSelected(DateFormat('yyyy-MM-dd').format(pickedDate!));
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(selectedDate == 'Select' ? 'Select Date' : selectedDate),
        ),
      ),
    );
  }

  Widget buildPhoneNumberField(
      String label,
      TextEditingController codeController,
      TextEditingController numberController) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: TextField(
              controller: codeController,
              decoration: InputDecoration(
                labelText: 'Code',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 5,
            child: TextField(
              controller: numberController,
              decoration: InputDecoration(
                labelText: label,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void saveProfile() async {
    // setState(() {
    //   isLoading = true;
    // });

    // await FirebaseFirestore.instance.collection('parents').add({
    //   'fullName': fullNameController.text,
    //   'familyType': familyType,
    //   'email': emailController.text,
    //   'phoneCode': phoneCodeController.text,
    //   'phoneNumber': phoneNumberController.text,
    //   'dateOfBirth': dateOfBirth,
    //   'location': location,
    //   'numberOfChildren': numberOfChildren,
    // });

    setState(() {
      isLoading = false;
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Profile Saved')));
  }
}
