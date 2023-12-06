import 'package:flutter/material.dart';
import 'package:news_app/screens/search_screen.dart';

AppBar buildAppBar(String title, BuildContext context, bool isGeneral) {


  return AppBar(
    toolbarHeight: 70,
    actions: [
      isGeneral == true
          ? const SizedBox(
              width: 20,
            )
          : IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
              icon: const Icon(
                Icons.search,
                size: 40,
                color: Colors.white,
              )),
      const SizedBox(
        width: 10,
      )
    ],
    title: Center(
        child: Text(
      title,
      style: const TextStyle(color: Colors.white),
    )),
    backgroundColor: Colors.green,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
    ),
  );
}
