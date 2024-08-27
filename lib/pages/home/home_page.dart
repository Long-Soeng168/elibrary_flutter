// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:elibrary/components/cards/article_card.dart';
import 'package:elibrary/components/cards/audio_card.dart';
import 'package:elibrary/components/cards/bulletin_card.dart';
import 'package:elibrary/components/cards/database_card.dart';
import 'package:elibrary/components/cards/image_card.dart';
import 'package:elibrary/components/cards/journal_card.dart';
import 'package:elibrary/components/cards/publication_card.dart';
import 'package:elibrary/components/cards/thesis_card.dart';
import 'package:elibrary/components/cards/video_card.dart';
import 'package:elibrary/components/my_drawer.dart';
import 'package:elibrary/components/my_list_header.dart';
import 'package:elibrary/components/my_slide_show.dart';
import 'package:elibrary/pages/home/publications/publication_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: MyDrawer(),
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Digital Library',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_outlined,
              size: 32,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: MySlideShow(),
            ),

            // Start Databases
            SizedBox(
              height: 8,
            ),
            MyListHeader(
              title: 'DATABASE',
              isShowSeeMore: false,
            ),
            Container(
              height: 140, // Set a fixed height for horizontal ListView
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  DatabaseCard(
                    image:
                        'https://thnal.com/assets/images/databases/1719990650_1719990423_epublication.png',
                    title: 'E-Publication',
                    onTap: () {
                      final route = MaterialPageRoute(
                          builder: (context) => PublicationPage());
                      Navigator.push(context, route);
                    },
                  ),
                  DatabaseCard(
                    image:
                        'https://thnal.com/assets/images/databases/1719983451_video-marketing.png',
                    title: 'Videos',
                    onTap: () {
                      final route = MaterialPageRoute(
                          builder: (context) => PublicationPage());
                      Navigator.push(context, route);
                    },
                  ),
                  DatabaseCard(
                    image:
                        'https://thnal.com/assets/images/databases/1719989919_image.png',
                    title: 'Images',
                    onTap: () {
                      final route = MaterialPageRoute(
                          builder: (context) => PublicationPage());
                      Navigator.push(context, route);
                    },
                  ),
                  DatabaseCard(
                    image:
                        'https://thnal.com/assets/images/databases/1719989980_audio.png',
                    title: 'Audios',
                    onTap: () {
                      final route = MaterialPageRoute(
                          builder: (context) => PublicationPage());
                      Navigator.push(context, route);
                    },
                  ),
                  DatabaseCard(
                    image:
                        'https://thnal.com/assets/images/databases/1719990023_bulletin.png',
                    title: 'Bulletins',
                    onTap: () {
                      final route = MaterialPageRoute(
                          builder: (context) => PublicationPage());
                      Navigator.push(context, route);
                    },
                  ),
                  DatabaseCard(
                    image:
                        'https://thnal.com/assets/images/databases/1720507192_article.png',
                    title: 'Articles',
                    onTap: () {
                      final route = MaterialPageRoute(
                          builder: (context) => PublicationPage());
                      Navigator.push(context, route);
                    },
                  ),
                  DatabaseCard(
                    image:
                        'https://thnal.com/assets/images/databases/1719990049_thesis.png',
                    title: 'Theses',
                    onTap: () {
                      final route = MaterialPageRoute(
                          builder: (context) => PublicationPage());
                      Navigator.push(context, route);
                    },
                  ),
                  DatabaseCard(
                    image:
                        'https://thnal.com/assets/images/databases/1719991715_1719990069_journal.png',
                    title: 'Journals',
                    onTap: () {
                      final route = MaterialPageRoute(
                          builder: (context) => PublicationPage());
                      Navigator.push(context, route);
                    },
                  ),
                ],
              ),
            ),
            // End Databases

            // Start Publications
            MyListHeader(title: 'Publications'),
            Container(
              height: 360, // Set a fixed height for horizontal ListView
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  PublicationCard(),
                  PublicationCard(),
                  PublicationCard(),
                  PublicationCard(),
                  PublicationCard(),
                ],
              ),
            ),
            // End Publications

            // Start Videos
            SizedBox(
              height: 20,
            ),
            MyListHeader(title: 'Videos'),
            Container(
              height: 184, // Set a fixed height for horizontal ListView
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  VideoCard(),
                  VideoCard(),
                  VideoCard(),
                  VideoCard(),
                  VideoCard(),
                ],
              ),
            ),
            // End Videos

            // Start Audios
            SizedBox(
              height: 20,
            ),
            MyListHeader(title: 'Audios'),
            Container(
              height: 184, // Set a fixed height for horizontal ListView
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  AudioCard(),
                  AudioCard(),
                  AudioCard(),
                  AudioCard(),
                  AudioCard(),
                ],
              ),
            ),
            // End Audios

            // Start Images
            SizedBox(
              height: 20,
            ),
            MyListHeader(title: 'Images'),
            Container(
              height: 220, // Set a fixed height for horizontal ListView
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ImageCard(),
                  ImageCard(),
                  ImageCard(),
                  ImageCard(),
                  ImageCard(),
                ],
              ),
            ),
            // End Images

            // // Start Bulletins
            // SizedBox(
            //   height: 20,
            // ),
            // MyListHeader(title: 'Bulletins'),
            // Container(
            //   height: 348, // Set a fixed height for horizontal ListView
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       BulletinCard(),
            //       BulletinCard(),
            //       BulletinCard(),
            //       BulletinCard(),
            //       BulletinCard(),
            //     ],
            //   ),
            // ),
            // // End Bulletins

            // // Start Articles
            // SizedBox(
            //   height: 20,
            // ),
            // MyListHeader(title: 'Articles'),
            // Container(
            //   height: 360, // Set a fixed height for horizontal ListView
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       ArticleCard(),
            //       ArticleCard(),
            //       ArticleCard(),
            //       ArticleCard(),
            //       ArticleCard(),
            //     ],
            //   ),
            // ),
            // // End Articles

            // // Start Theses
            // SizedBox(
            //   height: 20,
            // ),
            // MyListHeader(title: 'Theses'),
            // Container(
            //   height: 360, // Set a fixed height for horizontal ListView
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       ThesisCard(),
            //       ThesisCard(),
            //       ThesisCard(),
            //       ThesisCard(),
            //       ThesisCard(),
            //     ],
            //   ),
            // ),
            // // End Theses

            // // Start Journals
            // SizedBox(
            //   height: 20,
            // ),
            // MyListHeader(title: 'Journals'),
            // Container(
            //   height: 360, // Set a fixed height for horizontal ListView
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       JournalCard(),
            //       JournalCard(),
            //       JournalCard(),
            //       JournalCard(),
            //       JournalCard(),
            //     ],
            //   ),
            // ),
            // // End Journals
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
