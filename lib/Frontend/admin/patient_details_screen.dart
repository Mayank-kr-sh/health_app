import 'package:flutter/material.dart';
import 'package:health_app/Frontend/admin/appointment_schedule_screen.dart';

class PatientDetailsScreen extends StatelessWidget {
  final String patientName;
  final String age;
  final String gender;
  final String contactNumber;
  final String uhidNumber;
  final String bedNumber;
  final String consultant;
  final String address;
  final String provisionalDiagnosis;
  final String finalDiagnosis;

  const PatientDetailsScreen({
    required this.patientName,
    required this.age,
    required this.gender,
    required this.contactNumber,
    required this.uhidNumber,
    required this.bedNumber,
    required this.consultant,
    required this.address,
    required this.provisionalDiagnosis,
    required this.finalDiagnosis,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patient Name: $patientName',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('Age: $age'),
            Text('Gender: $gender'),
            Text('Contact: $contactNumber'),
            Text('UHID Number: $uhidNumber'),
            Text('Bed Number: $bedNumber'),
            Text('Consultant: $consultant'),
            Text('Address: $address'),
            Text('Provisional Diagnosis: $provisionalDiagnosis'),
            Text('Final Diagnosis: $finalDiagnosis'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AppointmentScheduleScreen(),
                  ),
                );
              },
              child: const Text('Schedule Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
