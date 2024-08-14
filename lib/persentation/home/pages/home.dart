import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/common/helper/is_dark_mode.dart';
import 'package:spotify_app/common/widgets/appbar/app_bar.dart';
import 'package:spotify_app/core/configs/assets/app_images.dart';
import 'package:spotify_app/core/configs/assets/app_vectors.dart';
import 'package:spotify_app/core/configs/theme/app_color.dart';
import 'package:spotify_app/persentation/home/widgets/news_songs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BesicAppBar(
        hideBack: true,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tabs(),
            SizedBox(
              height: 260,
              child: TabBarView(controller: _tabController, children: [
                const NewsSongs(),
                Container(),
                Container(),
                Container(),
              ]),
            ),
          ],
        ),
      ),
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
                AppVectors.homeCardArtist,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 40,
                ),
                child: Image.asset(
                  AppImages.homeImageTop,
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
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      isScrollable: true,
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 16,
      ),
      indicatorColor: AppColors.primary,
      tabs: const [
        Text(
          "News",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
        Text(
          "Vidios",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
        Text(
          "Artist",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
        Text(
          "Podcasts",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
