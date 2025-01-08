import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';
import 'package:myapp/reschedulepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.grey[100],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            navigationRow(),
            SizedBox(height: 20),
            welcomeSection(),
            SizedBox(height: 20),
            Expanded(child: courseSection(context)), // Pass context here
          ],
        ),
      ),
    );
  }

  Widget navigationRow() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Home', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Dashboard'),
          Text('My Courses'),
          Text('Portals'),
          Text('CTES Evaluation'),
          Text('Archive'),
        ],
      ),
    );
  }

  Widget welcomeSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Hi, Dr Wong Wei Ru!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              AnimatedEmoji(
                AnimatedEmojis.clap(SkinTone.mediumLight),
                size: 32,
                repeat: false,
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            'Explore your courses, manage your assignments, and more.',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget courseSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Courses',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(child: courseGrid(context)), // Pass context here
        ],
      ),
    );
  }

  Widget courseGrid(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.2,
      ),
      itemCount: 3,
      itemBuilder: (context, index) {
        return courseCard(
          context,
          'KQC 7017',
          'System Analysis and Design',
          'Faculty of Engineering',
        );
      },
    );
  }

  Widget courseCard(
    BuildContext context,
    String code,
    String title,
    String faculty,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                    image: DecorationImage(
                      image: AssetImage('lib/assets/Course_background.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      faculty,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      PopupMenuButton<String>(
                        icon: Icon(Icons.more_vert, color: Colors.black),
                        onSelected: (value) {
                          if (value == 'reschedule') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReschedulePage(
                                  courseCode: code,
                                  courseName: title,
                                ),
                              ),
                            );
                          }
                        },
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 'add_assignment',
                            child: Text('Add Assignment'),
                          ),
                          PopupMenuItem(
                            value: 'grading',
                            child: Text('Grading'),
                          ),
                          PopupMenuItem(
                            value: 'attendance',
                            child: Text('Attendance'),
                          ),
                          PopupMenuItem(
                            value: 'reschedule',
                            child: Text('Reschedule Class'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    code,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Session 2024/2025 Semester 1 (Group 1, 2)',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
