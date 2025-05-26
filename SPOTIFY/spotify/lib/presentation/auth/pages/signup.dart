import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart' show AppVectors;

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ), 
      body: const Column(
        children: [

        ],
      ),
    );
  }
}