import 'package:bezora/Widgets/search_widget.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 24, 24),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(height: 100, child: SearchWidget()),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // Set the clip behavior of the card
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  // Define the child widgets of the card
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                      Image.network(
                        'https://wallpapers.com/images/high/bored-ape-yacht-club-jlnlczwqmwsh8zx9.webp',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),

                      // Add a container with padding that contains the card's title, text, and buttons
                      Container(
                        color: Colors.black,
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Display the card's title using a font size of 24 and a dark grey color
                            Text(
                              "Cards Title 2",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.grey[800],
                              ),
                            ),
                            // Add a space between the title and the text
                            Container(height: 10),
                            // Display the card's text using a font size of 15 and a light grey color
                            Text(
                              " MyStringsSample.card_text",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[700],
                              ),
                            ),
                            // Add a row with two buttons spaced apart and aligned to the right side of the card
                            Row(
                              children: <Widget>[
                                // Add a spacer to push the buttons to the right side of the card
                                const Spacer(),
                                // Add a text button labeled "SHARE" with transparent foreground color and an accent color for the text
                                TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.transparent,
                                  ),
                                  child: const Text(
                                    "SHARE",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {},
                                ),
                                // Add a text button labeled "EXPLORE" with transparent foreground color and an accent color for the text
                                TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.transparent,
                                  ),
                                  child: const Text(
                                    "EXPLORE",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Add a small space between the card and the next widget
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // Set the clip behavior of the card
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  // Define the child widgets of the card
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Display an image at the top of the card that fills the width of the card and has a height of 160 pixels
                      Image.network(
                        'https://wallpapers.com/images/high/bored-ape-yacht-club-jlnlczwqmwsh8zx9.webp',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),

                      // Add a container with padding that contains the card's title, text, and buttons
                      Container(
                        color: Colors.black,
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Display the card's title using a font size of 24 and a dark grey color
                            Text(
                              "Cards Title 2",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.grey[800],
                              ),
                            ),
                            // Add a space between the title and the text
                            Container(height: 10),
                            // Display the card's text using a font size of 15 and a light grey color
                            Text(
                              " MyStringsSample.card_text",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[700],
                              ),
                            ),
                            // Add a row with two buttons spaced apart and aligned to the right side of the card
                            Row(
                              children: <Widget>[
                                // Add a spacer to push the buttons to the right side of the card
                                const Spacer(),
                                // Add a text button labeled "SHARE" with transparent foreground color and an accent color for the text
                                TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.transparent,
                                  ),
                                  child: const Text(
                                    "SHARE",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {},
                                ),
                                // Add a text button labeled "EXPLORE" with transparent foreground color and an accent color for the text
                                TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.transparent,
                                  ),
                                  child: const Text(
                                    "EXPLORE",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Add a small space between the card and the next widget
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
