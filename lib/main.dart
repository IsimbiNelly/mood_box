import 'package:flutter/material.dart';

void main() {
  runApp(const MoodBoxApp());
}

class MoodBoxApp extends StatelessWidget {
  const MoodBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoodBox',
      debugShowCheckedModeBanner: false,
      home: const MoodHomePage(),
    );
  }
}

class MoodHomePage extends StatefulWidget {
  const MoodHomePage({super.key});

  @override
  State<MoodHomePage> createState() => _MoodHomePageState();
}

class _MoodHomePageState extends State<MoodHomePage> {
  // Default mood settings
  Color _boxColor = Colors.grey.shade300;
  double _boxSize = 220;
  BorderRadius _boxRadius = BorderRadius.circular(20);
  String _moodLabel = 'How are you feeling?';
  String _moodMessage = 'Tap an emoji below 👇';
  String _moodEmoji = '🙂';

  // This runs when a mood button is tapped
  void _selectMood(String mood) {
    setState(() {
      if (mood == 'happy') {
        _boxColor = Colors.yellow.shade300;
        _boxSize = 260;
        _boxRadius = BorderRadius.circular(40);
        _moodLabel = 'Happy 😊';
        _moodMessage = 'You are doing amazing!';
        _moodEmoji = '😊';
      } else if (mood == 'tired') {
        _boxColor = Colors.blue.shade200;
        _boxSize = 200;
        _boxRadius = BorderRadius.circular(10);
        _moodLabel = 'Tired 😴';
        _moodMessage = 'Rest up, you deserve it.';
        _moodEmoji = '😴';
      } else if (mood == 'stressed') {
        _boxColor = Colors.red.shade300;
        _boxSize = 240;
        _boxRadius = BorderRadius.circular(0);
        _moodLabel = 'Stressed 😤';
        _moodMessage = 'Take a deep breath. You got this.';
        _moodEmoji = '😤';
      } else if (mood == 'excited') {
        _boxColor = Colors.purple.shade300;
        _boxSize = 270;
        _boxRadius = BorderRadius.circular(60);
        _moodLabel = 'Excited 😁';
        _moodMessage = 'Let that energy shine!';
        _moodEmoji = '😁';
      } else if (mood == 'sad') {
        _boxColor = Colors.blueGrey.shade200;
        _boxSize = 190;
        _boxRadius = BorderRadius.circular(20);
        _moodLabel = 'Sad 😢';
        _moodMessage = 'It is okay to feel this way.';
        _moodEmoji = '😢';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('MoodBox 🎭'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pick your mood!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            // ✨ THIS IS THE STAR OF THE SHOW — AnimatedContainer
            AnimatedContainer(
              duration: const Duration(milliseconds: 600), // Property 1: duration
              curve: Curves.easeInOut, // Property 2: curve
              width: _boxSize,
              height: _boxSize,
              decoration: BoxDecoration(
                color: _boxColor, // Property 3: color
                borderRadius: _boxRadius,
                boxShadow: [
                  BoxShadow(
                    color: _boxColor.withOpacity(0.5),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _moodEmoji,
                    style: const TextStyle(fontSize: 60),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _moodLabel,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      _moodMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Mood emoji buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _moodButton('😊', 'happy'),
                _moodButton('😴', 'tired'),
                _moodButton('😤', 'stressed'),
                _moodButton('😁', 'excited'),
                _moodButton('😢', 'sad'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build each emoji button
  Widget _moodButton(String emoji, String mood) {
    return GestureDetector(
      onTap: () => _selectMood(mood),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          emoji,
          style: const TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}