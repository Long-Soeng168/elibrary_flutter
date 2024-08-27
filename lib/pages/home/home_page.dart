// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:elibrary/components/cards/database_card.dart';
import 'package:elibrary/components/cards/my_card.dart';
import 'package:elibrary/components/my_drawer.dart';
import 'package:elibrary/components/my_list_header.dart';
import 'package:elibrary/components/my_slide_show.dart';
import 'package:elibrary/config/env.dart';
import 'package:elibrary/models/audio.dart';
import 'package:elibrary/models/image_model.dart';
import 'package:elibrary/models/publication.dart';
import 'package:elibrary/models/video.dart';
import 'package:elibrary/pages/home/audios/audio_detail_page.dart';
import 'package:elibrary/pages/home/images/image_detail_page.dart';
import 'package:elibrary/pages/home/publications/publication_detail_page.dart';
import 'package:elibrary/pages/home/publications/publication_page.dart';
import 'package:elibrary/pages/home/videos/video_detail_page.dart';
import 'package:elibrary/services/audio_service.dart';
import 'package:elibrary/services/image_service.dart';
import 'package:elibrary/services/publication_service.dart';
import 'package:elibrary/services/video_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<Publication> publications = [];
  bool isLoadingPublication = true;
  bool isLoadingPublicationError = false;

  List<Video> videos = [];
  bool isLoadingVideo = true;
  bool isLoadingVideoError = false;

  List<Audio> audios = [];
  bool isLoadingAudio = true;
  bool isLoadingAudioError = false;

  List<ImageModel> images = [];
  bool isLoadingImage = true;
  bool isLoadingImageError = false;

  @override
  void initState() {
    super.initState();
    getResource();
  }

  void getResource() {
    getPublications();
    getVideos();
    getAudios();
    getImages();
  }

  Future<void> getPublications() async {
    try {
      // Fetch publications outside of setState
      final fetchedPublications = await PublicationService.fetchPublications();
      // Update the state
      setState(() {
        publications = fetchedPublications;
        isLoadingPublication = false;
      });
    } catch (error) {
      // Handle any errors that occur during the fetch
      setState(() {
        isLoadingPublication = false;
        isLoadingPublicationError = true;
      });
      // You can also show an error message to the user
      print('Failed to load Publications: $error');
    }
  }

  Future<void> getVideos() async {
    try {
      final fetchedVideos = await VideoService.fetchVideos();
      setState(() {
        videos = fetchedVideos;
        isLoadingVideo = false;
      });
    } catch (error) {
      setState(() {
        isLoadingVideo = false;
        isLoadingVideoError = true;
      });
      print('Failed to load Videos: $error');
    }
  }

  Future<void> getAudios() async {
    try {
      final fetchedAudios = await AudioService.fetchAudios();
      setState(() {
        audios = fetchedAudios;
        isLoadingAudio = false;
      });
    } catch (error) {
      setState(() {
        isLoadingAudio = false;
        isLoadingAudioError = true;
      });
      print('Failed to load Audios: $error');
    }
  }

  Future<void> getImages() async {
    try {
      final fetchedImages = await ImageService.fetchImages();
      setState(() {
        images = fetchedImages;
        isLoadingImage = false;
      });
    } catch (error) {
      setState(() {
        isLoadingImage = false;
        isLoadingImageError = true;
      });
      print('Failed to load Images: $error');
    }
  }

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
            isLoadingPublication
                ? SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Visibility(
                    visible: publications.isNotEmpty,
                    child: Column(
                      children: [
                        MyListHeader(title: 'Publications'),
                        Container(
                          height:
                              360, // Set a fixed height for horizontal ListView
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: publications.length,
                            itemBuilder: (context, index) {
                              final publication = publications[index];
                              return MyCard(
                                  aspectRatio: 6 / 9,
                                  id: publication.id,
                                  title: publication.name,
                                  imageUrl:
                                      '${Env.baseImageUrl}publications/thumb/${publication.image}',
                                  onTap: () {
                                    final route = MaterialPageRoute(
                                      builder: (context) =>
                                          PublicationDetailPage(),
                                    );
                                    Navigator.push(context, route);
                                  });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
            Visibility(
              visible: isLoadingPublicationError,
              child: Container(
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Text('Error Loading Resources'),
                ),
              ),
            ),
            // End Publications

            // Start Videos
            isLoadingVideo
                ? SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Visibility(
                    visible: videos.isNotEmpty,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        MyListHeader(title: 'Videos'),
                        Container(
                          height:
                              184, // Set a fixed height for horizontal ListView
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: videos.length,
                            itemBuilder: (context, index) {
                              final video = videos[index];
                              return MyCard(
                                  aspectRatio: 16 / 9,
                                  id: video.id,
                                  title: video.name,
                                  imageUrl:
                                      '${Env.baseImageUrl}videos/thumb/${video.image}',
                                  onTap: () {
                                    final route = MaterialPageRoute(
                                      builder: (context) => VideoDetailPage(),
                                    );
                                    Navigator.push(context, route);
                                  });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
            Visibility(
              visible: isLoadingVideoError,
              child: Container(
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Text('Error Loading Resources'),
                ),
              ),
            ),
            // End Videos

            // Start Audios
            isLoadingAudio
                ? SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Visibility(
                    visible: audios.isNotEmpty,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        MyListHeader(title: 'audios'),
                        Container(
                          height:
                              184, // Set a fixed height for horizontal ListView
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: audios.length,
                            itemBuilder: (context, index) {
                              final audio = audios[index];
                              return MyCard(
                                  aspectRatio: 16 / 9,
                                  id: audio.id,
                                  title: audio.name,
                                  imageUrl:
                                      '${Env.baseImageUrl}audios/thumb/${audio.image}',
                                  onTap: () {
                                    final route = MaterialPageRoute(
                                      builder: (context) => AudioDetailPage(),
                                    );
                                    Navigator.push(context, route);
                                  });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
            Visibility(
              visible: isLoadingAudioError,
              child: Container(
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Text('Error Loading Resources'),
                ),
              ),
            ),
            // End Audios

            // Start Images
            isLoadingImage
                ? SizedBox(
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Visibility(
                    visible: images.isNotEmpty,
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        MyListHeader(title: 'Images'),
                        Container(
                          height:
                              220, // Set a fixed height for horizontal ListView
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: images.length,
                            itemBuilder: (context, index) {
                              final image = images[index];
                              return MyCard(
                                  aspectRatio: 4 / 3,
                                  id: image.id,
                                  title: image.name,
                                  imageUrl:
                                      '${Env.baseImageUrl}images/thumb/${image.image}',
                                  onTap: () {
                                    final route = MaterialPageRoute(
                                      builder: (context) => ImageDetailPage(),
                                    );
                                    Navigator.push(context, route);
                                  });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
            Visibility(
              visible: isLoadingImageError,
              child: Container(
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Text('Error Loading Resources'),
                ),
              ),
            ),
            // End Images
          ],
        ),
      ),
    );
  }
}
