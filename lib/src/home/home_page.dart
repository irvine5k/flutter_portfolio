import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/src/home/home_controller.dart';
import 'package:flutter_portfolio/src/home/widgets/app_bar_widget.dart';
import 'package:flutter_portfolio/src/home/widgets/header_widget.dart';
import 'package:flutter_portfolio/src/home/widgets/projects_widget.dart';
import 'package:flutter_portfolio/theme_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();

  HomeController get homeController =>
      Provider.of<HomeController>(context, listen: false);

  void toggleExpanded(bool showProjects) {
    controller.animateTo(
      showProjects ? 0 : 600,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );

    homeController.toggleShowProjects();
  }

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset == controller.initialScrollOffset) {
        if (homeController.showProjects == true) {
          final themeController =
              Provider.of<ThemeController>(context, listen: false);

          if (themeController.isDarkTheme) {
            themeController.toggleDarkTheme();
          }

          homeController.toggleShowProjects();
        }
      } else if (controller.offset <
          controller.position.maxScrollExtent - 150) {
        if (homeController.showProjects == false)
          homeController.toggleShowProjects();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final showProjects = Provider.of<HomeController>(context).showProjects;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        child: AppBarWidget(),
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          75,
        ),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        controller: controller,
        child: Container(
          height: MediaQuery.of(context).size.height * 1.2,
          child: Stack(
            children: <Widget>[
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                left: 0,
                right: 0,
                bottom: MediaQuery.of(context).size.height *
                    (showProjects ? 1 : (!kIsWeb ? 0.3 : 0.4)),
                child: HeaderWidget(
                  onTap: () => toggleExpanded(showProjects),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height -
                    (showProjects
                        ? MediaQuery.of(context).size.height * 0.65
                        : 250),
                left: 0,
                right: 0,
                child: ProjectsWidget(showProjects: showProjects),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
