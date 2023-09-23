import 'package:flutter/cupertino.dart';

class Tasksview extends StatelessWidget {
  const Tasksview({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: mediaQuery.height * 0.20,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
    );
  }
}
