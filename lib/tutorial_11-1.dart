import 'package:flutter/material.dart';

class Tutorial11Page extends StatelessWidget {
  const Tutorial11Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial 11-1'),
      ),
      body: PageView(
        children: [
          Container(
            color: Colors.red,
            child: const Center(
              child: Text(
                'Page 1',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Center(
              child: Text(
                'Page 2',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Page 3',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
