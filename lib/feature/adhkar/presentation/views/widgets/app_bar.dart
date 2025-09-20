import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return    SliverAppBar(
                    pinned: true,
                    centerTitle: true,
                    expandedHeight: 100,
                    backgroundColor: Colors.white,
                    flexibleSpace: FlexibleSpaceBar(
                      title: const Text(
                        'الأذكار اليومية',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
  }
}