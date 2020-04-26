import 'package:flutter/material.dart';
import 'package:flutter_portfolio/src/home/widgets/app_bar_link_button_widget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.08,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Kelven Galvão',
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      AppBarLinkButton(
                        title: 'LinkedIN',
                      ),
                      const SizedBox(width: 20),
                      AppBarLinkButton(
                        title: 'GitHub',
                      ),
                      const SizedBox(width: 20),
                      AppBarLinkButton(
                        title: 'Twitter',
                      ),
                      const SizedBox(width: 20),
                      AppBarLinkButton(
                        title: 'Email',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade100,
          ),
        ],
      ),
    );
  }
}
