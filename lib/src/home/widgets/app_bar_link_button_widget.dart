import 'package:flutter/material.dart';

class AppBarLinkButton extends StatelessWidget {
  const AppBarLinkButton({
    Key key,
    @required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title ?? '',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
