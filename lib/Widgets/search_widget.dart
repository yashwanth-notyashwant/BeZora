import 'package:flutter/material.dart';
import 'dart:ui';

class SearchWidget extends StatefulWidget {
  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController textController = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();

    // Add listener to the focus node
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    textController.dispose();
    super.dispose();
  }

  void _handleTapOutside() {
    if (isFocused) {
      focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTapOutside,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 24, 24, 24),
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black54,
              border:
                  //  isFocused
                  //     ? Border.all(color: Colors.white):
                  Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(28.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: SearchBar(
              hintText: "Search",
              controller: textController,
              focusNode: focusNode,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              onSubmitted: (String query) {
                // Handle search action when enter key is pressed
                print("Search query: $query");
                // You can add your search logic here
              },
              leading: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;
  final Widget leading;

  const SearchBar({
    required this.hintText,
    required this.controller,
    required this.focusNode,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.search,
    this.onSubmitted,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        icon: leading,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SearchWidget(),
  ));
}
