import 'package:flutter/material.dart';

BoxDecoration boxDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        offset: const Offset(4, 5),
        blurRadius: 5,
        color: Colors.black.withOpacity(0.5),
      ),
    ],
  );
}

BoxDecoration inputboxDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        offset: const Offset(4, 5),
        blurRadius: 5,
        color: Colors.black.withOpacity(0.3),
      ),
    ],
  );
}

Container boxcontainer() {
  return Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(10),
    ),
    child: const Center(
      child: Text('Custom Container'),
    ),
  );
}
