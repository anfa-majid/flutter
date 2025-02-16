import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final String title;
  final String date;
  final String location;
  final String organizer;
  final String imageSrc;

  const PostTile({
    Key? key,
    required this.title,
    required this.date,
    required this.location,
    required this.organizer,
    this.imageSrc = 'assets/images/download1.jpeg', // Default image path
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4), 
      child: Material(
        elevation: 3, 
        borderRadius: BorderRadius.circular(12), 
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(10), 
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Post Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageSrc,
                  width: 100,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12), 

              // Post Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 0), 
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 0), 
                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 0), 
                    Text(
                      organizer,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
