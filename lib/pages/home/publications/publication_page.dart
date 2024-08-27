// ignore_for_file: prefer_const_constructors

import 'package:elibrary/components/buttons/my_elevated_button.dart';
import 'package:elibrary/components/cards/my_card.dart';
import 'package:elibrary/config/env.dart';
import 'package:elibrary/models/publication.dart';
import 'package:elibrary/pages/home/publications/publication_detail_page.dart';
import 'package:elibrary/services/publication_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PublicationPage extends StatefulWidget {
  const PublicationPage({super.key});

  @override
  State<PublicationPage> createState() => _PublicationPageState();
}

class _PublicationPageState extends State<PublicationPage> {
  List<Publication> publications = [];
  bool isLoadingPublication = true;
  bool isLoadingPublicationError = false;

  @override
  void initState() {
    super.initState();
    getPublications();
  }

  Future<void> getPublications() async {
    try {
      // Fetch publications outside of setState
      final fetchedPublications = await PublicationService.fetchPublications(page: 1);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'E-Publications',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              filterModal(context);
            },
            icon: Icon(
              Icons.filter_list_outlined,
              size: 32,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Start Search
            MySearch(),
            // End Search

            SizedBox(height: 8),

            // Start Publications Grid
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
                        GridView.builder(
                          shrinkWrap:
                              true, // Important: Let GridView take up only needed space
                          physics:
                              NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            childAspectRatio:
                                8 / 14, // Aspect ratio of the grid items
                          ),
                          itemCount: publications
                              .length, // Total number of filtered items
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
                          }, // Use your PublicationCard widget
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

            // End Publications Grid

            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Future<dynamic> filterModal(BuildContext context) {
    return showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Example filter options
                FilterOption(
                  title: 'Publish Year',
                  options: ['Last 10 years', 'Last 6 years', 'Last year'],
                ),
                SizedBox(height: 16),
                FilterOption(
                  title: 'Category',
                  options: ['Science', 'Technology', 'Arts', 'History'],
                ),
                SizedBox(height: 16),
                FilterOption(
                  title: 'Sub-Category',
                  options: ['Science', 'Technology', 'Arts', 'History'],
                ),
                SizedBox(height: 16),
                FilterOption(
                  title: 'Author',
                  options: ['Author A', 'Author B', 'Author C'],
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: MyElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    title: 'Filter',
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MySearch extends StatelessWidget {
  const MySearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          width: 0.5,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey.shade400,
            size: 24,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 24,
            maxWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search...',
          hintStyle: TextStyle(color: Colors.grey.shade400),
        ),
      ),
    );
  }
}

class FilterOption extends StatefulWidget {
  final String title;
  final List<String> options;

  const FilterOption({Key? key, required this.title, required this.options})
      : super(key: key);

  @override
  _FilterOptionState createState() => _FilterOptionState();
}

class _FilterOptionState extends State<FilterOption> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: widget.options.map((option) {
            return ChoiceChip(
              label: Text(
                option,
                style: TextStyle(
                  color: selectedOption == option ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              selected: selectedOption == option,
              selectedColor: Theme.of(context)
                  .colorScheme
                  .primary, // Background color when selected
              backgroundColor: Theme.of(context)
                  .colorScheme
                  .background, // Background color when not selected
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
                side: BorderSide(
                  color: selectedOption == option
                      ? Theme.of(context)
                          .colorScheme
                          .primary // Border color when selected
                      : Theme.of(context)
                          .colorScheme
                          .primary, // Border color when not selected
                  width: 0.5, // Border width
                ),
              ),
              onSelected: (selected) {
                setState(() {
                  selectedOption = selected ? option : null;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
