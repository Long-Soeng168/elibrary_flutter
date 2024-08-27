// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:elibrary/components/cards/my_card.dart';
import 'package:elibrary/components/my_list_header.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Favorites',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Start Publications
            SizedBox(
              height: 8,
            ),
            MyListHeader(title: 'Publications'),
            Container(
              height: 360, // Set a fixed height for horizontal ListView
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
                  MyCard(),
                  MyCard(),
                  MyCard(),
                  MyCard(),
                  MyCard(),
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
                  MyCard(),
                  MyCard(),
                  MyCard(),
                  MyCard(),
                  MyCard(),
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
                  MyCard(),
                  MyCard(),
                  MyCard(),
                  MyCard(),
                  MyCard(),
                ],
              ),
            ),
            // End Images

            // Start Bulletins
            SizedBox(
              height: 20,
            ),
            MyListHeader(title: 'Bulletins'),
            Container(
              height: 348, // Set a fixed height for horizontal ListView
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
            // End Bulletins

            // Start Articles
            SizedBox(
              height: 20,
            ),
            MyListHeader(title: 'Articles'),
            Container(
              height: 360, // Set a fixed height for horizontal ListView
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
            // End Articles

            // Start Theses
            SizedBox(
              height: 20,
            ),
            MyListHeader(title: 'Theses'),
            Container(
              height: 360, // Set a fixed height for horizontal ListView
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
            // End Theses

            // Start Journals
            SizedBox(
              height: 20,
            ),
            MyListHeader(title: 'Journals'),
            Container(
              height: 360, // Set a fixed height for horizontal ListView
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
            // End Journals
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
