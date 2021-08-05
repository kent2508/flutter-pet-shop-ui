import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.search_outlined,
            color: Colors.blueGrey,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'search something here...',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }
}
