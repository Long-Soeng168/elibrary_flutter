import 'package:flutter/material.dart';

class DetailListCard extends StatelessWidget {
  const DetailListCard({super.key, required this.keyword, required this.value});
  final String keyword;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      borderOnForeground: true,
      child: Container(
        padding: EdgeInsets.all(2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                      width: 1, color: Theme.of(context).colorScheme.primary),
                ),
              ),
              width: 100,
              child: Text(keyword, style: TextStyle(
                fontWeight: FontWeight.bold,
              ),),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(value),
            ),
          ],
        ),
      ),
    );
  }
}
