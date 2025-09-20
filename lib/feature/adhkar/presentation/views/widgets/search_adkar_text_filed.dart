import 'package:flutter/material.dart';

class SearchAdkarTextFiled extends StatelessWidget {
  const SearchAdkarTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
    decoration: InputDecoration(
    
      hintText: " ابحث ",
      prefixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(13),
        
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16)
    ),
    );
  }
}