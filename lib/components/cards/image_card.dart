import 'package:elibrary/components/error_image.dart';
import 'package:elibrary/pages/home/images/image_detail.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final route = MaterialPageRoute(builder: (context) => ImageDetail());
        Navigator.push(context, route);
      },
      child: Card(
        elevation: 0,
        child: Container(
          width: 200,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade200)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade200,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Hero(
                      tag:
                          'https://thnal.com/assets/images/images/thumb/1724644805cYik37Kni4.jpg',
                      child: Image.network(
                        'https://thnal.com/assets/images/images/thumb/1724644805cYik37Kni4.jpg',
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const ErrorImage(size: 50);
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
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Text(
                  'ការបោះឆ្នោតជ្រើសរើសក្រុមប្រឹក្សារាជធានី ក្រុបប្រឹក្សាខេត្ត ក្រុមប្រឹក្សាក្រុង ក្រុមប្រឹក្សាស្រុក ក្រុមប្រឹក្សាខណ្ឌ អាណត្តិទី៤',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
