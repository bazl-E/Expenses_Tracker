import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.filter_alt_outlined,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: null,
          ),
          hintText: 'Search by Remark',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
