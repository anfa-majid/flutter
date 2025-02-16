import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final String title;
  final String comment;
  final String date;

  const CommentCard({
    Key? key,
    required this.title,
    required this.comment,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20), 
      child: Column(
        children: [
          Material(
            child: Padding(
              padding: const EdgeInsets.only(left: 41, right: 50, bottom: 10), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Title
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 2),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start, // Ensures both comment & date start from same point
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3), // Aligns arrow properly
                        child: Image.asset(
                          'assets/images/image-removebg-preview.png',
                          width: 18,
                          height: 18,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start, 
                          children: [
                            Text(
                              '"$comment"',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF929292),
                              ),
                              maxLines: 1, // 
                              overflow: TextOverflow.ellipsis, 
                            ),
                            const SizedBox(height: 2), 
                            Text(
                              date,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF929292),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),

          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
