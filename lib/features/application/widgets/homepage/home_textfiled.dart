import 'package:flutter/material.dart';

class HomeTextFiled extends StatelessWidget {
  const HomeTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0, 1), // changes position of shadow
        ),
      ], color: Colors.grey.shade100, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20)),
            width: MediaQuery.of(context).size.width - 100,
            child: const TextField(
              autocorrect: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 30),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              ),
            ),
          ),
          Container(child: const Icon(Icons.search))
        ],
      ),
    );
  }
}
