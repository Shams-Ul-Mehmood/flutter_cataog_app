import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/Catalog_Themes.dart';

class Catalog_Images extends StatelessWidget {
  final String image;

  const Catalog_Images({super.key, required this.image}) : assert( image != null );


  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.rounded.p8.color(context.canvasColor).make().p16().wPCT(context: context, widthPCT: context.isMobile ? 40 : 20);
  }
}