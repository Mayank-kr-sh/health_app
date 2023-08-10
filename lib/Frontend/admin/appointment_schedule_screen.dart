import 'package:flutter/material.dart';

class AppointmentScheduleScreen extends StatelessWidget {
  const AppointmentScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Schedule'),
      ),
      body: const Center(
        child: Text('Select a date and time for the appointment'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Save the appointment details
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
