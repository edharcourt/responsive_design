import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Design'),
      ),
      body: Center(
        child: Container(
          color: Colors.grey[200],
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 800),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return Row(
                  // wide layout
                  children: [
                    _buildAvatar(),
                    const SizedBox(width: 20),
                    Expanded(
                      child: _buildContent(),
                    ),
                  ],
                );
              } else {
                return Column(
                  // narrow layout
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildAvatar(),
                    SizedBox(height: 20),
                    _buildContent(),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

// function that returns a Widget
Widget _buildAvatar() {
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Colors.blueAccent,
      shape: BoxShape.circle,
    ),
    child: Icon(Icons.person, size: 50, color: Colors.white),
  );
}

// Content Widget for the profile
Widget _buildContent() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start, //  left jusifies
    children: [
      Text(
        'Poindexter Dankworth',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      Text('Major: Computer Science'),
      Text('Favorite class: CS220'),
      SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {},
        child: Text('Log in'),
      ),
    ],
  );
}
