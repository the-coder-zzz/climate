import 'package:flutter/material.dart';
import 'package:climate/widgets/bottom_bar.dart';
import 'package:climate/widgets/carousel.dart';
import 'package:climate/widgets/featured_heading.dart';
import 'package:climate/widgets/featured_tiles.dart';
import 'package:climate/widgets/floating_quick_access_bar.dart';
import 'package:climate/widgets/main_heading.dart';
import 'package:climate/widgets/menu_drawer.dart';
import 'package:climate/widgets/top_bar_contents.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  String _selectedFeature = 'Renewable Energy';

  // Keys for scrollable widgets
  final GlobalKey _homeSectionKey = GlobalKey();
  final GlobalKey _featuredSectionKey = GlobalKey();
  final GlobalKey _knowledgeSectionKey = GlobalKey();
  final GlobalKey _contactSectionKey = GlobalKey();

  _scrollListener() {
    setState(() {
      // Just update the scroll position if needed
    });
  }

  void _scrollToSection(GlobalKey key) {
    final RenderObject? renderObject = key.currentContext?.findRenderObject();
    if (renderObject is RenderBox) {
      final offset = renderObject.localToGlobal(Offset.zero).dy;
      _scrollController.animateTo(
        offset + _scrollController.offset - AppBar().preferredSize.height,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onFeatureSelected(String feature) {
    setState(() {
      _selectedFeature = feature;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: screenSize.width < 800
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                'Climate Solutionize',
                style: TextStyle(
                  color: Color(0xFF077bd7),
                  fontSize: 26,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 70),
              child: TopBarContents(
                onHomePressed: () {
                  _scrollController.animateTo(
                    0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                onFeaturedPressed: () {
                  _scrollToSection(_featuredSectionKey);
                },
                onKnowledgePressed: () {
                  _scrollToSection(_knowledgeSectionKey);
                },
                onContactPressed: () {
                  _scrollToSection(_contactSectionKey);
                },
              ),
            ),
      drawer: MenuDrawer(
        onHomePressed: () {
          _scrollController.animateTo(
            0,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        onFeaturedPressed: () {
          _scrollToSection(_featuredSectionKey);
        },
        onKnowledgePressed: () {
          _scrollToSection(_knowledgeSectionKey);
        },
        onContactPressed: () {
          _scrollToSection(_contactSectionKey);
        },
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Stack(
              key: _homeSectionKey, // Add key for home section
              children: [
                Container(
                  color: Colors.white,
                  child: SizedBox(
                    height: screenSize.height * 0.90,
                    width: screenSize.width,
                    child: Image.asset(
                      'images/background2.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    FloatingQuickAccessBar(
                      screenSize: screenSize,
                      onFeatureSelected: _onFeatureSelected,
                    ),
                    Container(
                      color: Colors.white, // Set background color to white
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          FeaturedHeading(
                            key:
                                _featuredSectionKey, // Add key for featured section
                            screenSize: screenSize,
                          ),
                          FeaturedTiles(
                            screenSize: screenSize,
                            selectedFeature: _selectedFeature,
                            onFeatureSelected: (String feature) {},
                          ),
                          MainHeading(
                            key:
                                _knowledgeSectionKey, // Add key for main heading section
                            screenSize: screenSize,
                          ),
                          MainCarousel(),
                          SizedBox(height: screenSize.height / 10),
                          BottomBar(
                            key:
                                _contactSectionKey, // Add key for contact section
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
