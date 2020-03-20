import 'package:flutter/material.dart';
import 'package:taxi_uber/homePage.dart';
import 'package:taxi_uber/model/welcomeModel.dart';
import 'package:taxi_uber/themes/mainTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String NextText = "Next";
  bool imInLastPage = false;
  int currentPosition = 1;
  List<WelcomeModel> welecomes = [
    WelcomeModel("assets/welcome.png", "Download , call, go ",
        "Praesent tellus mauris, tincidunt nec ipsum id, faucibus pellentesque leo. Nunc congue ac tellus quis porttitor. "),
    WelcomeModel("assets/welcome.png", " Wssalni App",
        "Praesent tellus mauris, tincidunt nec ipsum id, faucibus pellentesque leo. Nunc congue ac tellus quis porttitor. "),
    WelcomeModel("assets/welcome.png", "Wssalni App",
        "Praesent tellus mauris, tincidunt nec ipsum id, faucibus pellentesque leo. Nunc congue ac tellus quis porttitor. "),
    WelcomeModel("assets/welcome.png", "Wssalni App",
        "Praesent tellus mauris, tincidunt nec ipsum id, faucibus pellentesque leo. Nunc congue ac tellus quis porttitor. "),
  ];
  PageController _pageController;
  double transitionFactor = 1;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.45);
  }

  @override
  Widget build(BuildContext context) {
    double offSet = MediaQuery.of(context).size.height * 0.120;
    double raduis = MediaQuery.of(context).size.width * 0.09;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _slider(context),
          Transform.translate(
            child: Align(
              alignment: Alignment.center,
              child: _pageIndicators(context, currentPosition),
            ),
            offset: Offset(0, offSet),
          ),
          _bottomNavigation(context, raduis),
        ],
      ),
    );
  }

  Widget _bottomNavigation(BuildContext context, double raduis) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
            color: mainTheme.primaryColorLight,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(raduis),
                topLeft: Radius.circular(raduis))),
        height: MediaQuery.of(context).size.height * 0.115,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              child: Text("Skip"),
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setBool("seen", true);
                _goToHomePage(context);
                //TODO SKIP
              },
            ),
            Padding(
              padding: EdgeInsets.only(right: 25),
              child: MaterialButton(
                minWidth: 140,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(raduis))),
                elevation: 0,
                color: mainTheme.primaryColorDark,
                child: Text(
                  NextText,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  //TODO go next Slide

                  if (imInLastPage) {
                    _goToHomePage(context);
                  } else {
                    _pageController.nextPage(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _slider(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.11),
          child: PageView.builder(
              itemCount: this.welecomes.length,
              controller: _pageController,
              onPageChanged: (position) {
                setState(() {
                  currentPosition = position;
                });
                if (position == welecomes.length - 1) {
                  setState(() {
                    imInLastPage = true;
                    NextText = "Get Started";
                  });
                } else {
                  setState(() {
                    imInLastPage = false;
                    NextText = "Next";
                  });
                }
              },
              itemBuilder: (context, position) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
                  child: Column(
                    children: <Widget>[
                      AnimatedBuilder(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(20.0),
                            child: Image(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                welecomes[position].image,
                              ),
                            ),
                          ),
                        ),
                        builder: (BuildContext context, Widget child) {
                          if (_pageController.position.haveDimensions) {
                            transitionFactor = _pageController.page - position;
                            transitionFactor =
                                (1 - transitionFactor.abs() * 0.1)
                                    .clamp(0.0, 1.0);
                            return ClipRRect(
                              borderRadius: new BorderRadius.circular(20.0),
                              child: Image(
                            //    width: 400,
                                height:
                                    (MediaQuery.of(context).size.height * 0.5) *
                                        transitionFactor,
                                fit: BoxFit.contain,
                                image: AssetImage(
                                  welecomes[position].image,
                                ),
                              ),
                            );
                          } else {
                            return ClipRRect(
                              borderRadius: new BorderRadius.circular(20.0),
                              child: Image(
                                height:  MediaQuery.of(context).size.height * 0.5,
                                fit: BoxFit.contain,
                                image: AssetImage(
                                  welecomes[position].image,
                                ),
                              ),
                            );
                          }
                        },
                        animation: _pageController,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      AnimatedBuilder(
                        child: Column(
                          children: <Widget>[
                            Text(welecomes[position].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .copyWith(color: Color(0xFF636363))),
                            SizedBox(
                              height: 5,
                            ),
                            Text(welecomes[position].body,
                                style: Theme.of(context)
                                    .textTheme
                                    .subhead
                                    .copyWith(color: Color(0xFF636363))),
                          ],
                        ),
                        animation: _pageController,
                        builder: (BuildContext context, Widget child) {
                          if (_pageController.position.haveDimensions) {
                            transitionFactor = _pageController.page - position;
                            transitionFactor =
                                (1 - transitionFactor.abs()).clamp(0.0, 1.0);
                            return textAnimation(position, transitionFactor);
                          } else {
                            return textAnimation(position, 1.0);
                          }
                        },
                      ),
                    ],
                  ),
                );
              })),
    );
  }

  Widget indicatorPage(color, double margin) {
    return Container(
      width: 15,
      height: 5,
      margin: EdgeInsets.only(right: margin),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
    );
  }

  Widget _pageIndicators(BuildContext context, position) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _newPageIndicator());
  }

  List<Widget> _newPageIndicator() {
    List<Widget> _widgets = [];
    for (int i = 0; i < welecomes.length; i++) {
      _widgets.add(indicatorPage(
          currentPosition == i ? Color(0xFFEFBC06) : Color(0xFFEFDC99),
          i == welecomes.length - 1 ? 0 : 12));
    }
    return _widgets;
    // indicatorPage(Colors.yellow, 16.0),
    // indicatorPage(Colors.yellow, 16.0),
    // indicatorPage(Colors.red, 0),
  }

  Widget textAnimation(position, transactionFactor) {
    return AnimatedOpacity(
      child: Column(children: <Widget>[
        Text(welecomes[position].title,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(color: Color(0xFF636363))),
        SizedBox(
          height: 5,
        ),
        Text(welecomes[position].body,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subhead
                .copyWith(color: Color(0xFF636363))),
      ]),
      duration: Duration(milliseconds: 300),
      opacity: transactionFactor,
    );
  }

  void _goToHomePage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
  }
}
