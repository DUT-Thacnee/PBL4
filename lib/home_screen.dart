import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          // Input display boxes
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Input 1: ...'),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Input 2: ...'),
                ),
              ),
            ],
          ),
          // Statistics table
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: Text('Statistics Table')),
            ),
          ),
          // Microphone button
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/voice');
            },
            icon: const Icon(Icons.mic),
            label: const Text('Voice Input'),
          ),
        ],
      ),
    );
  }
}
