import 'package:flutter/material.dart';

class SectionView extends StatelessWidget {
  const SectionView({
    Key? key,
    this.title = '',
    this.showAction = false,
    this.onAction,
  }) : super(key: key);

  final String title;
  final bool showAction;
  final Function? onAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 20,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black)),
            showAction
                ? TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      if (onAction != null) onAction!();
                    },
                    child: Text(
                      'Show all',
                      style: TextStyle(fontSize: 14, color: Color(0xFFEF7C91)),
                    ))
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
