import 'package:flutter/material.dart';

class SelectedIteam extends StatelessWidget {
  String selectedText;

  SelectedIteam(
    this.selectedText,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    selectedText,
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class UnSelectedIteam extends StatelessWidget {
  String selectedText;

  UnSelectedIteam(
    this.selectedText,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.transparent),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  selectedText,
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ),
      ],
    );
  }
}
