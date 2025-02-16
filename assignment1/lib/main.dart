import 'package:flutter/material.dart';
import 'package:assignment1/widgets/Comments_tile.dart';
import 'package:assignment1/widgets/Posts_tile.dart';
import 'package:assignment1/widgets/Stats_tile.dart';
import 'package:assignment1/widgets/appbar.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 0; // 0 = Posts, 1 = Comments, 2 = Stats

  final List<Map<String, String>> events = [
  {
    'eventName': 'Tech Conference',
    'eventDate': '30 November 2024, 9:00 AM',
    'eventAddress': '13th Street, Park Avenue',
    'eventPerson': 'John Doe',
    'imagePath': 'assets/images/download1.jpeg',
  },
  {
    'eventName': 'Leadership Seminar',
    'eventDate': '28 Jan 2025, 2:00 PM',
    'eventAddress': '13th Street, Park Avenue',
    'eventPerson': 'John Doe',
    'imagePath': 'assets/images/download1.jpeg',
  },
  {
    'eventName': 'Entrepreneurship Summit',
    'eventDate': '15 March 2025, 10:00 AM', 
    'eventAddress': '13th Street, Park Avenue',
    'eventPerson': 'John Doe',
    'imagePath': 'assets/images/download1.jpeg',
  },
];


  final List<Map<String, String>> comments = [
  {
    'eventName': 'Flutter Flash',
    'comment': 'Looks like an amazing event!',
    'eventDate': '30 November 2024, 11:00 PM',
  },
  {
    'eventName': "Bob's annual BBQ",
    'comment': 'Wish I could’ve been there:(',
    'eventDate': '2 August 2024, 10:31 PM', 
  },
  {
    'eventName': 'Networking Lounge', 
    'comment': 'Will the event be starting on time?', 
    'eventDate': '25 June 2023, 12:00 AM', 
  },
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: const Text("Profile"),
            shape: CustomAppBarShape(), 
          ),


          // Profile Section
          const SizedBox(height: 70),
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.black,
            child: ClipOval(
              child: Image.asset(
                'assets/images/download.jpeg',
                width: 110,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "John Doe",
            style: TextStyle(
              color: Color(0xFFD62828),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'John Doe exists. John Doe builds. John Doe innovates. What’s next? Only time will tell...',
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),

          // Selection Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTabButton("Posts", 0),
              _buildTabButton("Comments", 1),
              _buildTabButton("Stats", 2),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 1,
            width: 400,
            color: Colors.black,
          ),
          const SizedBox(height: 10),

          // Content Section
          Expanded(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.45,
              child: ListView.builder(
                itemCount: selectedIndex == 2
                    ? 1
                    : (selectedIndex == 1 ? comments.length : events.length),
                itemBuilder: (context, index) {
                  if (selectedIndex == 0) {
                    final event = events[index];
                    return Column(
                      children: [
                        PostTile(
                          title: event['eventName']!,
                          date: event['eventDate']!,
                          location: event['eventAddress']!,
                          organizer: event['eventPerson']!,
                          imageSrc: event['imagePath']!,
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  } else if (selectedIndex == 1) {
                    final comment = comments[index];
                    return Column(
                      children: [
                        CommentCard(
                          title: comment['eventName']!,
                          comment: comment['comment']!,
                          date: comment['eventDate']!,
                          
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        const StatisticsTile(),
                        const SizedBox(height: 20),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.red : Colors.black54,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
