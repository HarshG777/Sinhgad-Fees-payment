import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinhgadapp/components/long_button.dart';
import 'package:sinhgadapp/components/my_drawer.dart';
import 'package:sinhgadapp/pages/additional_fees.dart';
import 'package:sinhgadapp/pages/payment_history.dart';
import 'package:sinhgadapp/pages/pending_fees.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  File? _imageFile;

  //pick image
  Future pickImage() async {
    final ImagePicker picker = ImagePicker();

    //pick from gallery
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    //upload image preview
    if (image != null) {
      setState(() {
        _imageFile = File(image.path);
      });
    }
  }

  //upload
  Future uploadImage() async {
    if (_imageFile == null) return;
    //generate file name
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final path = 'uploads/$fileName';

    await Supabase.instance.client.storage
        .from('images')
        .upload(path, _imageFile!)
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Image uploaded successfully'),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6F9),
      appBar: AppBar(
        title: const Text('DASHBOARD'),
        centerTitle: false,
        backgroundColor: const Color(0xFF212A3E),
        foregroundColor: Colors.white,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 30),
              //sinhgad students text
              const Text(
                "SINHGAD INSTITUTE OF TECHNOLOGY",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),

              //Profile pic and name etc information
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Profile pic
                  GestureDetector(
                    onTap: () {
                      pickImage();
                      uploadImage();
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F6F9),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(
                                    255, 120, 203, 250), // Shadow color
                                // spreadRadius: 10, // Spread radius
                                blurRadius: 15, // Blur radius
                                offset: Offset(7, 7), // Shadow position (x, y)
                              ),
                              BoxShadow(
                                color: Color.fromARGB(
                                    255, 120, 203, 250), // Shadow color
                                // spreadRadius: 10, // Spread radius
                                blurRadius: 15, // Blur radius
                                offset:
                                    Offset(-7, -7), // Shadow position (x, y)
                              ),
                              BoxShadow(
                                color: Color.fromARGB(
                                    255, 120, 203, 250), // Shadow color
                                // spreadRadius: 10, // Spread radius
                                blurRadius: 15, // Blur radius
                                offset: Offset(-7, 7), // Shadow position (x, y)
                              ),
                              BoxShadow(
                                color: Color.fromARGB(
                                    255, 120, 203, 250), // Shadow color
                                // spreadRadius: 10, // Spread radius
                                blurRadius: 15, // Blur radius
                                offset: Offset(7, -7), // Shadow position (x, y)
                              ),

                              // BoxShadow(
                              //   color: Color.fromARGB(255, 90, 193, 252),
                              //   blurRadius: 25,
                              // )
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: _imageFile != null
                                ? Image.file(
                                    _imageFile!,
                                    fit: BoxFit.cover,
                                  )
                                : const Center(
                                    child: const Icon(
                                      Icons.person,
                                      size: 100,
                                      color: Colors.grey,
                                    ),
                                  ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ANUJ SHARMA",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "2022-2025",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "7887985748",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "SIT, Lonavala",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 30),
              Text(
                'Sharma Anuj Suresh/2222/LSIT/000001',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 60),
              LongButton(
                title: 'Pending fees',
                image: Image.asset('assets/sandTime.png'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PendingFees()),
                  );
                },
              ),
              const SizedBox(height: 30),
              LongButton(
                title: 'Additional Fees',
                image: Image.asset('assets/funds.png'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdditionalFees()),
                  );
                },
              ),

              const SizedBox(height: 30),
              LongButton(
                title: 'Payment History',
                image: Image.asset('assets/history.png'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentHistory()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
