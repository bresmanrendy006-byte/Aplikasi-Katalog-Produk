import 'package:flutter/material.dart';

class Avatar1 extends StatefulWidget {
  const Avatar1({super.key});

  @override
  State<Avatar1> createState() => _Avatar1State();
}

class _Avatar1State extends State<Avatar1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Simple Code')),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                "https://randomuser.me/api/portraits/men/32.jpg",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
