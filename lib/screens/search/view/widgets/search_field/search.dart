import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
     TextField(
                style:const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border:const OutlineInputBorder(),
                  hintText: 'Search',
                  fillColor:Colors.teal.shade300,
                  filled: true,
                  hintStyle:const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 17,
                      fontWeight: FontWeight.w200),
                ),
              );
  }
}