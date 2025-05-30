import 'package:flutter/material.dart' show BuildContext, Scaffold, StatelessWidget, Widget;
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:spotify/common/widgets/appbar/app_bar.dart' show BasicAppbar;
import 'package:spotify/core/configs/assets/app_vectors.dart' show AppVectors;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 30,
          width: 40,
        ),
      ),
    );
  }
}