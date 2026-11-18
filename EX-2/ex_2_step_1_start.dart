import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: const [
            FavoriteCard(
              title: 'Dart & Flutter',
              description: 'Building cross-platform mobile applications',
              initialFavorite: true,
            ),
            FavoriteCard(
              title: 'State Management',
              description: 'Managing widget states using StatefulWidget',
              initialFavorite: false,
            ),
            FavoriteCard(
              title: 'UI Layouts',
              description: 'Using Rows, Columns, and Expanded widgets',
              initialFavorite: true,
            ),
          ],
        ),
      ),
    ));


// EX 2 Stateful Favorite Card Widget

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;
  final bool initialFavorite;

  const FavoriteCard({
    super.key,
    required this.title,
    required this.description,
    this.initialFavorite = false,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.initialFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite; // Toggles the state independently for each card
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5), // Bottom border line
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
    );
  }
}