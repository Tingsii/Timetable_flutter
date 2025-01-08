import 'package:flutter/material.dart';

class ReschedulePage extends StatelessWidget {
  final String courseCode;
  final String courseName;

  const ReschedulePage({
    required this.courseCode,
    required this.courseName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'lib/assets/Spectrum.png',
              height: 190,
              width: 190,
            ),
            Spacer(),
            Icon(Icons.notifications, color: Colors.black),
            SizedBox(width: 16),
            Icon(Icons.message, color: Colors.black),
            SizedBox(width: 16),
            Icon(Icons.person, color: Colors.black),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Dr Wong Wei Ru!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Explore your courses, manage your assignments, and more.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(12),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Course', style: TextStyle(color: Colors.white)),
                  Text('Participants', style: TextStyle(color: Colors.white)),
                  Text('Grades', style: TextStyle(color: Colors.white)),
                  Text('Competencies', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              '$courseCode: $courseName',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Spacer(),
            Text(
              'Are you sure you want to reschedule the class?',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add logic for selecting date and processing
                  },
                  child: Text('Yes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, // Set explicitly to red
),

                  child: Text('No'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
