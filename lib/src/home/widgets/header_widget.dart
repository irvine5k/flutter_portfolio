import 'package:flutter/material.dart';
import 'package:flutter_portfolio/src/app_colors.dart';
import 'package:flutter_portfolio/src/network_assets.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.2,
        vertical: 60,
      ),
      child: Column(
        children: <Widget>[
          Image.network(NetworkAssets.logo),
          const SizedBox(height: 40),
          Text(
            'Shooting eye-catching moments for fun',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
              fontSize: 60,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
            ),
            child: Text(
              'Every image is a story in frame.'
              ' Discover my most popular images and uncover the stories behing them.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(height: 30),
          FlatButton(
            onPressed: onTap,
            color: AppColors.blue,
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 15,
            ),
            child: Text(
              'Discover my work',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
