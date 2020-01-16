import 'package:flutter/material.dart';
import 'package:flutter_ui_despicable/models/character.dart';
import 'package:flutter_ui_despicable/pages/character_detail_screen.dart';

import '../styleguide.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;
  final PageController pageController;
  final int currentPage;

  const CharacterWidget(
      {this.character, this.pageController, this.currentPage});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 250),
                pageBuilder: (context, _, __) =>
                    CharacterDetailScreen(character: character)));
      },
      child: AnimatedBuilder(
        animation: pageController,
        builder: (context, child) { 
          double value = 1;
          if(pageController.position.haveDimensions){
            value = pageController.page - currentPage;
            value = (1 - (value.abs() * 0.6)).clamp(0.0,1.0);
            if (currentPage == 1) 
            print('value $value'); 
          }
          return Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: CharacterCardBackgroundClipper(),
                child: Hero(
                  tag: 'background-${character.name}',
                  child: Container(
                    height: 0.55 * screenHeight ,
                    width: 0.9 * screenWidth * value,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: character.colors,
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.8),
              child: Hero(
                tag: 'image-${character.name}',
                child: Image.asset(
                  character.imagePath,
                  height: screenHeight * 0.60 * value,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48, right: 32, bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: 'name-${character.name}',
                    child: Material(
                        color: Colors.transparent,
                        child: Container(
                            child:
                                Text(character.name, style: AppTheme.heading))),
                  ),
                  Text('Tap to Read more', style: AppTheme.subHeading)
                ],
              ),
            ),
          ],
        );
        }
      ),
    );
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;

    clippedPath.moveTo(0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(
        1, size.height - 1, 0 + curveDistance, size.height);
    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(size.width - 1, 0,
        size.width - curveDistance - 5, 0 + curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);
    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
