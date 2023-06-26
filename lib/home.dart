import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim/resources/assets.dart';
import 'package:muslim/resources/colors.dart';
import 'package:muslim/resources/strings_manager.dart';
import 'package:muslim/soura_page.dart';

import 'models/koran_item_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<String> tabItems = [
  "السور",
  "المحفوظات",
];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabItems.length,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text(
              "القرآن الكريم",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: ColorsManager.fernGreen,
            leading: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            ),
            flexibleSpace: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        AssetsManager.backgroundImage,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            bottom: TabBar(
              labelColor: ColorsManager.white,
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.white,
              overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              labelPadding: EdgeInsets.zero,
              labelStyle: const TextStyle(fontSize: 14),
              physics: const BouncingScrollPhysics(),
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 37),
              tabs: tabItems
                  .map((e) => Tab(
                        text: e,
                      ))
                  .toList(),
            ),
          ),
          body: TabBarView(children: [_buildTabBarViewBody(), _buildTabBarViewBody()])),
    );
  }

  _buildTabBarViewBody() => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsManager.backgroundColor,
        body: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: _buildSearchWidget()),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildLisview(),
            )
          ],
        ),
      );

  _buildSearchWidget() => Container(
        height: 45,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: const Icon(
              Icons.search,
              color: ColorsManager.grey2,
            ),
            hintText: StringsManager.search,
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: ColorsManager.white)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: ColorsManager.white)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: ColorsManager.white)),
          ),
        ),
      );

  _buildLisview() => ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SouraScreen(),
              ));
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 56 / 2,
                    backgroundColor: ColorsManager.white2,
                    child: SvgPicture.asset(AssetsManager.koranSvg),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                child: Text(
                              items[index].souraTitle,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            )),
                            Text(
                              items[index].type,
                              style: const TextStyle(color: Color(0xFF01807E)),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringsManager.souraNumber + items[index].souraNumber.toString(),
                              style: const TextStyle(color: ColorsManager.darkgray, fontSize: 16),
                            ),
                            Text(
                              StringsManager.ayatNumber + items[index].ayatNumber.toString(),
                              style: const TextStyle(color: ColorsManager.darkgray, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: items.length);
}
