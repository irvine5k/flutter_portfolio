import 'package:flutter/material.dart';
import 'package:flutter_portfolio/src/app_colors.dart';
import 'package:flutter_portfolio/src/network_assets.dart';
import 'package:flutter_portfolio/theme_controller.dart';
import 'package:provider/provider.dart';

class ProjectsWidget extends StatefulWidget {
  const ProjectsWidget({
    Key key,
    @required this.showProjects,
  }) : super(key: key);

  final bool showProjects;

  @override
  _ProjectsWidgetState createState() => _ProjectsWidgetState();
}

class _ProjectsWidgetState extends State<ProjectsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: widget.showProjects ? 1 : 0,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Selected Projects',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Hover over the cards to learn more about projects',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: Provider.of<ThemeController>(context)
                              .toggleDarkTheme,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Theme.of(context).buttonColor,
                            child: Icon(
                              Provider.of<ThemeController>(context).isDarkTheme
                                  ? Icons.wb_sunny
                                  : Icons.brightness_2,
                              color: AppColors.pink,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Enable dark mode',
                          style: TextStyle(
                            color: AppColors.pink,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) => AnimatedPadding(
                  duration: Duration(
                    milliseconds: 500 + (index * 100),
                  ),
                  padding:
                      EdgeInsets.only(bottom: widget.showProjects ? 0 : 100),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.only(right: 45),
                    child: AspectRatio(
                      aspectRatio: 0.6,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              NetworkAssets.art,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
