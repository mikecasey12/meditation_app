import 'package:flutter/material.dart';

class ScrollingButton extends StatelessWidget {
  final List<String> musicType;
  final int currentIndex;
  final Function switchIndexFn;
  final Color backgroundColor;
  final Color selectedColor;
  final TextStyle? textStyle;
  const ScrollingButton(
      {super.key,
      required this.currentIndex,
      required this.musicType,
      required this.switchIndexFn,
      required this.backgroundColor,
      required this.selectedColor,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
        height: size.height * 0.06,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: musicType.map((mt) {
              var ch = musicType.indexOf(mt);
              return GestureDetector(
                onTap: () {
                  switchIndexFn(ch);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 15, top: 1, bottom: 1),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color:
                          currentIndex == ch ? selectedColor : backgroundColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      mt,
                      style: currentIndex == ch ? textStyle : null,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ));
  }
}
