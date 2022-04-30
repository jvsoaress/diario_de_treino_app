import 'package:flutter/material.dart';

class PagesIndicator extends StatelessWidget {
  final int currentPageIndex;
  final int pagesCount;

  const PagesIndicator({
    Key? key,
    required this.currentPageIndex,
    required this.pagesCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pagesCount,
        (index) => Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                currentPageIndex == index ? Colors.blue : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
