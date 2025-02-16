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
              padding: const EdgeInsets.only(left: 35, right: 50, bottom: 10),
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

                  Padding(
                    padding: const EdgeInsets.only(left: 5), 
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2), 
                          child: CustomPaint(
                            size: const Size(18, 18),
                            painter: BoldCurvedLeftUpArrowPainter(Colors.grey),
                          ),
                        ),
                        const SizedBox(width: 4),
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
                                maxLines: 1,
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

// Custom Painter for Arrow
class BoldCurvedLeftUpArrowPainter extends CustomPainter {
  final Color color;

  BoldCurvedLeftUpArrowPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final Path path = Path();

    path.moveTo(size.width - 4, size.height);
    path.lineTo(7, size.height);
    path.quadraticBezierTo(-size.width * 0.1, size.height, 0, 0);
    path.moveTo(0, 0);
    path.lineTo(-size.width * 0.3, size.height * 0.3);
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, size.height * 0.3);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
