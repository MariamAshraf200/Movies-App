import 'package:flutter/material.dart';
import '../../modelclass/data.dart'; // Ensure this is required for `textapp`

class Description extends StatelessWidget {
  final String? name;
  final String? description;
  final String? bannerurl;
  final String? posterurl;
  final String? vote;
  final String? launch_on;

  Description({
    Key? key,
    this.name,
    this.description,
    this.bannerurl,
    this.posterurl,
    this.vote,
    this.launch_on,
  }) : super(key: key);

  final List<Color> color = [Colors.black, Colors.black12];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Movie Details',
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star_border_sharp),
          )
        ],
      ),
      body: SingleChildScrollView(  // Wrap the content with a SingleChildScrollView
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: color,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.5, // Responsive height
                child: Column(
                  children: [
                    Container(
                      width: screenWidth, // Full width of screen
                      child: Image.network(
                        bannerurl ?? '',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 150),
                      ),
                      padding: EdgeInsetsDirectional.only(bottom: screenHeight * 0.02), // Responsive padding
                    ),
                    textapp(
                      text: '❤️ Average Rating - ${vote ?? 'N/A'}',
                      size: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              Container(
                padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
                child: textapp(
                  text: name ?? '',
                  size: 24,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: screenWidth * 0.05), // Responsive padding
                child: textapp(
                  text: launch_on ?? '',
                  size: 14,
                ),
              ),
              Row(
                children: [
                  Container(
                    height: screenHeight * 0.25, // Responsive height
                    width: screenWidth * 0.25, // Responsive width
                    child: Image.network(
                      posterurl ?? '',
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 50),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
                      child: textapp(
                        text: description ?? '',
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
