import 'package:flutter/material.dart';
import 'package:pet_shop/core/color_palette.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    @required this.onPressed,
    this.isMinus = false,
  }) : super(key: key);

  final Function? onPressed;
  final bool isMinus;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isMinus ? Color(0xFFC0C0C0) : Palette.gMainColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
            padding: EdgeInsets.zero,
            color: Colors.white,
            icon: Icon(isMinus ? Icons.remove_outlined : Icons.add_outlined),
            onPressed: () {
              if (this.onPressed != null) this.onPressed!();
            }),
      ),
    );
  }
}
