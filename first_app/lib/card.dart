import 'package:flutter/material.dart';
import 'package:my_first_app/character_model.dart';

class itemCard extends StatelessWidget {
  final Character item;

  itemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,  // Ensures that the card stretches to fill the width
        children: [
          Expanded(
            child: ClipRRect(  // Added ClipRRect for better image rounding within the card
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                item.imgUrl ?? 'https://via.placeholder.com/150',
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.affiliation,
              style: TextStyle(
                fontSize: 14,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
              child: Icon(
                Icons.add_shopping_cart,
                color: Colors.blue,
              ),
            ),
        ],
      ),
    );
  }
}
