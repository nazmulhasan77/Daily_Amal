import 'package:daily_amal/pages/TrackerPage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amal Tracker',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Amal Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: amalItems.length,
          itemBuilder: (context, index) {
            final item = amalItems[index];
            return AmalButton(
              title: item['title'],
              icon: item['icon'],
              color: item['color'],
              onTap: () {
                if (item['title'] == 'Track Amal Here') {
                  // Navigate to TrackerScreen when "Track Amal Here" is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TrackerScreen1()),
                  );
                } else {
                  // Navigate to AmalDetailScreen for other items
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AmalDetailScreen(title: item['title']),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}

class AmalButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  AmalButton({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AmalDetailScreen extends StatelessWidget {
  final String title;

  AmalDetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'Track your $title here.',
          style: TextStyle(fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to log completion or set reminder
        },
        child: Icon(Icons.check),
      ),
    );
  }
}

// List of Amal items with titles, icons, and colors for styling
final List<Map<String, dynamic>> amalItems = [
  {'title': 'Track Amal Here', 'icon': Icons.access_alarm, 'color': Colors.green},
  {'title': 'Roza', 'icon': Icons.restaurant, 'color': Colors.orange},
  {'title': 'Zikir', 'icon': Icons.favorite, 'color': Colors.red},
  {'title': 'Quran', 'icon': Icons.book, 'color': Colors.blue},
  {'title': 'Sadaqah', 'icon': Icons.volunteer_activism, 'color': Colors.purple},
  {'title': 'Duas', 'icon': Icons.menu_book, 'color': Colors.teal},
];

class TrackerScreen extends StatefulWidget {
  @override
  _TrackerScreenState createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  Map<String, bool> activityStatus = {
    "Jamat": false,
    "Jamat Miss": false,
    "Israk/Chast/Awabin": false,
    "Tahajjut/Kiamul Layl": false,
    "Roja": false,
    "Quran": false,
    "Hadis": false,
    "Book": false,
    "Fiqh (Masala)": false,
    "Sokal + Sondha": false,
    "Before Sleep": false,
    "Dorud *50": false,
    "৩ Tasbih": false,
    "৭০* Istegfar": false,
    "Miswak": false,
    "Call Family": false,
    "Phone using Time": false,
    "Sleep Duration (h)": false,
  };

  int dailyPoint = 0;
  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  void calculatePoints() {
    dailyPoint = activityStatus.values.where((completed) => completed).length;
  }

  Future<void> submitData() async {
    calculatePoints();

    // Replace 'user_id' with the actual user ID from your authentication
    await FirebaseFirestore.instance.collection('users').doc('user_id').set({
      'daily_point': {currentDate: dailyPoint},
    }, SetOptions(merge: true)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Points submitted for $currentDate!")));
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $error")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Date: $currentDate', style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView(
                children: activityStatus.keys.map((activity) {
                  return CheckboxListTile(
                    title: Text(activity),
                    value: activityStatus[activity],
                    onChanged: (bool? value) {
                      setState(() {
                        activityStatus[activity] = value!;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            ElevatedButton(
              onPressed: submitData,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
