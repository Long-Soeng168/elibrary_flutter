// ignore_for_file: prefer_const_constructors

import 'package:elibrary/components/cards/detail_list_card.dart';
import 'package:elibrary/components/cards/my_card.dart';
import 'package:elibrary/components/my_gallery.dart';
import 'package:elibrary/components/my_list_header.dart';
import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {
  ImageDetailPage({super.key});

  final List<String> imageUrls = [
    'https://thnal.com/assets/images/images/thumb/1724644805cYik37Kni4.jpg',
    'https://thnal.com/assets/images/images/thumb/1724645207ijk4Luu0MV.jpg',
    'https://thnal.com/assets/images/images/thumb/1724645220EdDXuHwoSG.jpg',
    'https://thnal.com/assets/images/images/1724643818BFMdOmmg49.jpg',
    'https://thnal.com/assets/images/images/1724643416EE7dhcbSp0.jpg',
    'https://thnal.com/assets/images/images/1724248852GktzRMNaGc.jpg',
    'https://thnal.com/assets/images/images/1724643605gcHCupf1yN.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Colors.transparent,
        title: Text(
          'Image',
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
                
                // Display the first image at the top
                MyGallery(imageUrls: imageUrls),

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
                      const Column(children: [
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
                MyListHeader(title: 'Related Items'),
                Container(
                  height: 220, // Set a fixed height for horizontal ListView
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
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
