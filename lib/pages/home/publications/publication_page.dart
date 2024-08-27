// ignore_for_file: prefer_const_constructors

import 'package:elibrary/components/buttons/my_elevated_button.dart';
import 'package:elibrary/components/cards/publication_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PublicationPage extends StatefulWidget {
  const PublicationPage({super.key});

  @override
  State<PublicationPage> createState() => _PublicationPageState();
}

class _PublicationPageState extends State<PublicationPage> {
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
              showModalBottomSheet(
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
                            options: [
                              'Last 10 years',
                              'Last 6 years',
                              'Last year'
                            ],
                          ),
                          SizedBox(height: 16),
                          FilterOption(
                            title: 'Category',
                            options: [
                              'Science',
                              'Technology',
                              'Arts',
                              'History'
                            ],
                          ),
                          SizedBox(height: 16),
                          FilterOption(
                            title: 'Sub-Category',
                            options: [
                              'Science',
                              'Technology',
                              'Arts',
                              'History'
                            ],
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
                                Navigator.pop(
                                    context); // Close the bottom sheet
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
            Container(
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
            ),
            // End Search

            SizedBox(height: 8),

            // Start Publications Grid
            GridView.builder(
              shrinkWrap:
                  true, // Important: Let GridView take up only needed space
              physics:
                  NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                childAspectRatio: 8 / 14, // Aspect ratio of the grid items
              ),
              itemCount: 10, // Total number of filtered items
              itemBuilder: (context, index) {
                return PublicationCard(); // Use your PublicationCard widget
              },
            ),
            // End Publications Grid

            SizedBox(height: 8),
          ],
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
