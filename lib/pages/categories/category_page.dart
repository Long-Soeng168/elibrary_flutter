// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:elibrary/components/cards/category_card_tile.dart';
import 'package:elibrary/components/cards/tab_card.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8, // Updated to match the number of tabs
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
              'Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              TabCard(
                  image:
                      'https://necelibrary.com/assets/images/databases/1719990650_1719990423_epublication.png',
                  title: 'E-Publication'),
              TabCard(
                  image:
                      'https://necelibrary.com/assets/images/databases/1719983451_video-marketing.png',
                  title: 'Videos'),
              TabCard(
                  image:
                      'https://necelibrary.com/assets/images/databases/1719989919_image.png',
                  title: 'Images'),
              TabCard(
                  image:
                      'https://necelibrary.com/assets/images/databases/1719989980_audio.png',
                  title: 'Audios'),
              TabCard(
                  image:
                      'https://necelibrary.com/assets/images/databases/1719990023_bulletin.png',
                  title: 'Bulletins'),
              TabCard(
                  image:
                      'https://thnal.com/assets/images/databases/1720507192_article.png',
                  title: 'Articles'),
              TabCard(
                  image:
                      'http://www.elibrary-rule.com/assets/images/databases/1719990049_thesis.png',
                  title: 'Theses'),
              TabCard(
                  image:
                      'http://www.elibrary-rule.com/assets/images/databases/1719991715_1719990069_journal.png',
                  title: 'Journals'),
            ],
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(top: 4, bottom: 4),
          child: TabBarView(
            children: [
              // Start Epublications
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryCardTile(),
                    CategoryCardTile(),
                  ],
                ),
              ),
              // End Epublications
          
              // Start Videos
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryCardTile(),
                    CategoryCardTile(),
                  ],
                ),
              ),
              // End Videos
          
              // Start Images
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryCardTile(),
                    CategoryCardTile(),
                  ],
                ),
              ),
              // End Images
          
              // Start Audios
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryCardTile(),
                    CategoryCardTile(),
                  ],
                ),
              ),
              // End Audios
          
              // Start Bulletins
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryCardTile(),
                    CategoryCardTile(),
                  ],
                ),
              ),
              // End Bulletins
          
              // Start Articles
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryCardTile(),
                    CategoryCardTile(),
                  ],
                ),
              ),
              // End Articles
          
              // Start Theses
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryCardTile(),
                    CategoryCardTile(),
                  ],
                ),
              ),
              // End Theses
          
              // Start Journal
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryCardTile(),
                    CategoryCardTile(),
                  ],
                ),
              ),
              // End Journal
          
            
            ],
          ),
        ),
      ),
    );
  }
}
