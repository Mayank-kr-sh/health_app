import 'package:flutter/material.dart';
import 'patient_details_screen.dart';

class PatientListScreen extends StatelessWidget {
  final List<Map<String, String>> patients = [
    {
      'patientName': 'Ram',
      'age': '35',
      'gender': 'Male',
      'contactNumber': '987-654-3210',
      'uhidNumber': '567890',
      'bedNumber': '102',
      'consultant': 'Dr. Gupta',
      'address': '456 Elm St',
      'provisionalDiagnosis': 'Cough',
      'finalDiagnosis': 'Respiratory Infection',
    },
    {
      'patientName': 'Shyam',
      'age': '28',
      'gender': 'Male',
      'contactNumber': '123-789-4560',
      'uhidNumber': '123457',
      'bedNumber': '103',
      'consultant': 'Dr. Patel',
      'address': '789 Oak Ave',
      'provisionalDiagnosis': 'Headache',
      'finalDiagnosis': 'Migraine',
    },
    {
      'patientName': 'Ravi',
      'age': '42',
      'gender': 'Male',
      'contactNumber': '555-123-7890',
      'uhidNumber': '987654',
      'bedNumber': '104',
      'consultant': 'Dr. Kumar',
      'address': '321 Pine Rd',
      'provisionalDiagnosis': 'Fever',
      'finalDiagnosis': 'Influenza',
    },
  ];

  PatientListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient List'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/doctor_avatar.png'), // Replace with actual image
                    radius: 30,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Dr. John Doe', // Replace with the doctor's name
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Option 1'),
              onTap: () {
                // Handle option 1
              },
            ),
            ListTile(
              title: const Text('Option 2'),
              onTap: () {
                // Handle option 2
              },
            ),
            // Add more options as needed
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: patients.length,
          itemBuilder: (context, index) {
            final patient = patients[index];
            final patientName = patient['patientName'] ?? 'Unknown';
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.only(bottom: 10.0),
              child: ListTile(
                title: Text(patientName),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PatientDetailsScreen(
                        patientName: patient['patientName']!,
                        age: patient['age']!,
                        gender: patient['gender']!,
                        contactNumber: patient['contactNumber']!,
                        uhidNumber: patient['uhidNumber']!,
                        bedNumber: patient['bedNumber']!,
                        consultant: patient['consultant']!,
                        address: patient['address']!,
                        provisionalDiagnosis: patient['provisionalDiagnosis']!,
                        finalDiagnosis: patient['finalDiagnosis']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
