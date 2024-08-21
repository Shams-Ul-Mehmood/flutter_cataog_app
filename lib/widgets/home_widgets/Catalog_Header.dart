import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/Catalog_Themes.dart';

class Catalog_Header extends StatelessWidget {
  const Catalog_Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(Catalog_Themes.darkBlueColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}