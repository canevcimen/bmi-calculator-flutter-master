import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({required this.colour, this.cardChild, this.onPressed});

  final Color colour;
  final Widget? cardChild;  //ReusableCard'a yeni bir Widget eklemek için kullanıyoruz.
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,    //cardChild'ı kullanabilmek için child: cardChild, yapıyoruz.
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
