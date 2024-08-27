import 'package:elibrary/components/error_image.dart';
import 'package:flutter/material.dart';

class TabCard extends StatelessWidget {
  const TabCard({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Image.network(
            image,
            width: 28,
            height: 28,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const ErrorImage(size: 28);
            },
            loadingBuilder: (context, child, progress) {
              if (progress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
          SizedBox(width: 10),
          Text(title),
        ],
      ),
    );
  }
}
