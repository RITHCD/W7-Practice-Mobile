import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the DEBUG banner
      home: ImageGallery(),
    );
  }
}

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  // List of images in assets folder
  final List<String> images = [
    'assets/bird.jpg',
    'assets/bird2.jpg',
    'assets/girl.jpg',
    'assets/insect.jpg',
    'assets/man.jpg',
  ];

  int currentIndex = 0;

  void _nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % images.length;
    });
  }

  void _previousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + images.length) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image viewer'),
        backgroundColor: Colors.green,
        actions: [
          // Previous image button
          IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: _previousImage,
            tooltip: 'Go to the previous image',
          ),
          // Next image button
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: _nextImage,
            tooltip: 'Go to the next image',
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            images[currentIndex],
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}