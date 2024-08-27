// ignore_for_file: prefer_const_constructors

import 'package:elibrary/components/cards/detail_list_card.dart';
import 'package:elibrary/components/cards/my_card.dart';
import 'package:elibrary/components/my_list_header.dart';
import 'package:elibrary/components/my_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class Item {
  final String id;
  final String title;
  final String imageUrl;
  final String description;

  Item({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
  });
}

class VideoDetailPage extends StatelessWidget {
  final Item item = Item(
    id: '1',
    title: 'Sample Publication',
    imageUrl: 'https://via.placeholder.com/600x250',
    description: 'This is a description of the sample publication.',
  );

  final List<Item> relatedItems = [
    Item(
      id: '2',
      title: 'Related Item 1',
      imageUrl: 'https://via.placeholder.com/120x80',
      description: 'Description for related item 1.',
    ),
    Item(
      id: '3',
      title: 'Related Item 2',
      imageUrl: 'https://via.placeholder.com/120x80',
      description: 'Description for related item 2.',
    ),
    Item(
      id: '4',
      title: 'Related Item 3',
      imageUrl: 'https://via.placeholder.com/120x80',
      description: 'Description for related item 3.',
    ),
  ];

  VideoDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Colors.transparent,
        title: Text(
          'Video',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              size: 32,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Start Image and Detail Section
                // Image.network(
                //     'https://d1csarkz8obe9u.cloudfront.net/themedlandingpages/tlp_hero_book-cover-adb8a02f82394b605711f8632a44488b.jpg?ts%20=%201698323696',
                //     width: double.infinity,
                //     errorBuilder: (context, error, stackTrace) {
                //   return const ErrorImage(size: 222);
                // }),
                // End Image and Detail Section

                // Start Video
                MyVideoPlayer(
                  dataSourceType: DataSourceType.network,
                  url:
                      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                ),
                // End Video

                // Start Description
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text('The Evolution of Quantum Computing',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(height: 8.0),
                      Column(children: [
                        // Start Detail
                        DetailListCard(
                          keyword: 'Author',
                          value: 'John Doe',
                        ),
                        DetailListCard(
                          keyword: 'Edition',
                          value: '2',
                        ),
                        DetailListCard(
                          keyword: 'Year',
                          value: '2023',
                        ),
                        DetailListCard(
                          keyword: 'Publisher',
                          value: 'Science Journal Publishing',
                        ),
                        DetailListCard(
                          keyword: 'Category',
                          value: 'Science / Physics',
                        ),
                        DetailListCard(
                          keyword: 'Language',
                          value: 'Language',
                        ),
                        DetailListCard(
                          keyword: 'Pages',
                          value: '150',
                        ),
                        DetailListCard(
                          keyword: 'ISBN',
                          value: '978-3-16-148410-0',
                        ),
                        DetailListCard(
                          keyword: 'Location',
                          value: 'New York',
                        ),
                        DetailListCard(
                          keyword: 'Last Update',
                          value: '22-Aug-2024',
                        ),
                        DetailListCard(
                          keyword: 'Keywords',
                          value: 'Research Computing',
                        ),
                        // End Detail

                        ListTile(
                          contentPadding: EdgeInsets.all(2),
                          title: Text(
                            'Description',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              'This article delves into the advancements in quantum computing over the past decade, highlighting key milestones and future potential. The discussion covers theoretical foundations, experimental breakthroughs, and practical applications. With a focus on both hardware and software developments, the article provides a comprehensive overview of the state of quantum computing today.'),
                        ),
                      ])
                    ],
                  ),
                ),
                // End Description

                // Start  Related Items
                SizedBox(height: 24),
                MyListHeader(title: 'Related'),
                Container(
                  height: 184, // Set a fixed height for horizontal ListView
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                      MyCard(),
                    ],
                  ),
                ),
                // End Publications

                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
