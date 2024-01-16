import 'package:flutter/material.dart';
import 'package:userapp/view/home/search.dart';

class EditPopupMenu extends StatelessWidget {
  const EditPopupMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String value) {
        if (value == 'search') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SearchPage()),
          );
        }
      },
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: 'search',
            child: Text('Search'),
          ),
        ];
      },
    );
  }
}