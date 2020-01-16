import 'package:flutter/material.dart';
import 'package:flutter_ui_despicable/Widgets/character_widget.dart';
import 'package:flutter_ui_despicable/models/character.dart';

import '../styleguide.dart';

class CharactersListingScreen extends StatefulWidget {
  @override
  _CharactersListingScreenState createState() =>
      _CharactersListingScreenState();
}

class _CharactersListingScreenState extends State<CharactersListingScreen> {
  PageController _pageController;
  int currentPage = 0;
  

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
        viewportFraction: 1.0, initialPage: currentPage, keepPage: false);
  }

  @override
  Widget build(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;  

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 0.0),
                child: Image.asset('assets/images/boku_no_hero-logo.png',
                width: screenWidth * 0.60,),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    for (var i = 0; i< characters.length; i++)
                      CharacterWidget(character: characters[i], pageController: _pageController,currentPage: i )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppHeading extends StatelessWidget {
  const AppHeading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: 'Despicable Me', style: AppTheme.display1),
          TextSpan(text: '\n'),
          TextSpan(text: 'Characters', style: AppTheme.display2),
        ],
      ),
    );
  }
}
