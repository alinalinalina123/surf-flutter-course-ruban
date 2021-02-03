import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomFloatingActionButton({
    Key key,
    @required this.title,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        height: 40.0,
        width: MediaQuery.of(context).size.width / 2,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          gradient: new LinearGradient(
            colors: [Colors.yellow, Colors.green],
            begin: FractionalOffset.centerLeft,
            end: FractionalOffset.centerRight,
          ),
        ),
        child: Center(
          child: Row(
            children: [
              Icon(
                icon,
                color: Theme.of(context).primaryColor,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
