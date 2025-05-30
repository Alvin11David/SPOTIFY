import 'package:flutter/material.dart' show BuildContext, Scaffold, TabBar, TabController, Widget, Colors;
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart' show BasicAppbar;
import 'package:spotify/core/configs/assets/app_images.dart' show AppImages;
import 'package:spotify/core/configs/assets/app_vectors.dart' show AppVectors;
import 'package:spotify/core/configs/theme/app_colors.dart' show AppColors;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tabs()
          ],
          )
      )
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                AppVectors.homeTopCard
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 60,
                ),
                child: Image.asset(
                  AppImages.homeArtist
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      isScrollable: true,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      indicatorColor: AppColors.primary,
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 40
      ),
      tabs: [
        Text(
          'News',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16
          )
        ),
        Text(
          'Videos',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16
          )
        ),
        Text(
          'Artists',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16
          )
        ),
        Text(
          'Podcats',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16
          )
        ),
      ],
      );
  }
}