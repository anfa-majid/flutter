import 'package:flutter/material.dart';

class StatisticsTile extends StatelessWidget {
  const StatisticsTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Ensure the tiles are centrally aligned
        children: [
          // Stats for Posts
          Column(
            children: [
              Text(
                '19', // Number of posts
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF77F00),
                ),
              ),
              SizedBox(height: 3), // Exact spacing
              Text(
                'Posts', // Label
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black, 
                ),
              ),
            ],
          ),
          SizedBox(width: 100), // Exact spacing between the two columns
          // Stats for Comments
          Column(
            children: [
              Text(
                '32', // Number of comments
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF77F00), 
                ),
              ),
              SizedBox(height: 3), // Exact spacing
              Text(
                'Comments', // Label
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black, 
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
