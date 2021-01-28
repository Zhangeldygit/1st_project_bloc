import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  final bool isHided;
  final String title;
  final double barHeight = 50.0;

  GradientAppBar({
    Key key,
    this.title,
    this.isHided = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;

    return new Container(
      padding: new EdgeInsets.only(top: statusbarHeight),
      height: statusbarHeight + barHeight,
      child: Stack(
        children: [
          Offstage(
            offstage: isHided,
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          Center(
            child: SizedBox(
              width: 200,
              child: Text(
                title,
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [Color(0xff322C54), Color(0xff231D49)],
            begin: const FractionalOffset(1, 1),
            end: const FractionalOffset(1, 1),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
    );
  }
}
