import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SelectableButtonScreen(), // Part 3: Column container
      ),
    );
  }
}

//  PARTS 1 & 2: Stateful Selectable Button

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  // Part 2: Manage selection state
  bool isSelected = false;

  void _toggleSelection() {
    setState(() {
      isSelected = !isSelected; // Reverse selection on click
    });
  }

  @override
  Widget build(BuildContext context) {
    // Part 2: Getters / conditional values based on the table specification
    final String textLabel = isSelected ? "Selected" : "Not selected";
    final Color textColor = isSelected ? Colors.white : Colors.black;
    final Color backgroundColor = isSelected ? Colors.blue.shade500 : Colors.blue.shade50;

    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor, // Background color change
          ),
          onPressed: _toggleSelection,
          child: Center(
            child: Text(
              textLabel,
              style: TextStyle(
                color: textColor, // Text color change
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// EX 1 - PART 3: Column with Multiple Buttons

class SelectableButtonScreen extends StatelessWidget {
  const SelectableButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EX 1 - Selectable Buttons')),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableButton(),
            SizedBox(height: 16),
            SelectableButton(),
            SizedBox(height: 16),
            SelectableButton(),
          ],
        ),
      ),
    );
  }
}