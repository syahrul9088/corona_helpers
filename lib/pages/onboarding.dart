import 'package:corona_helpers/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: 5.0,
      width: 34,
      decoration: BoxDecoration(
        color: isActive ? Color(0xff78A9EF) : Color(0xffE1DADA),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Container(
                //   alignment: FractionalOffset.bottomLeft,
                //   child: FlatButton(
                //     onPressed: () => print('Skip'),
                //     child: Text(
                //       'Skip',
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 20.0,
                //       ),
                //     ),
                //   ),
                // ),
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/png/onboard_realtime.png',
                                ),
                                height: 301.0,
                                width: 269.0,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            
                            Text(
                              'Real Time Kasus Corona',
                              style: GoogleFonts.nunito(
                                fontSize: 27,
                                color: Colors.black,
                                fontWeight: FontWeight.w700
                              ),
                              textAlign: TextAlign.center
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Dapatkan kasus corona setiap hari oleh  ChatBot WhatsApp.',
                              style: GoogleFonts.nunito(
                                fontSize: 20,
                                color: Color(0xff949494),
                                fontWeight: FontWeight.w700
                              ),
                              textAlign: TextAlign.center
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/png/onboard_risk.png',
                                ),
                                height: 301.0,
                                width: 180.0,
                              ),
                            ),
                            
                            SizedBox(height: 10.0),
                            Text(
                              'Tes Risiko Kasus Corona',
                              style: GoogleFonts.nunito(
                                  fontSize: 27,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700
                              ),
                              textAlign: TextAlign.center
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Jangan lupa cek kesehatanmu sebelum berpergian.',
                              style: GoogleFonts.nunito(
                                  fontSize: 20,
                                  color: Color(0xff949494),
                                  fontWeight: FontWeight.w700
                              ),
                              textAlign: TextAlign.center
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/png/onboard_zona.png',
                                ),
                                height: 301.0,
                                width: 269.0,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Center(child: 
                              Text(
                                'Kasus Corona Daerah',
                                style: GoogleFonts.nunito(
                                    fontSize: 27,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Untuk kamu yang kepo kategori zona di daerah mu.',
                              style: GoogleFonts.nunito(
                                  fontSize: 20,
                                  color: Color(0xff949494),
                                  fontWeight: FontWeight.w700
                              ),
                              textAlign: TextAlign.center
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: FlatButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Next',
                                   style: GoogleFonts.nunito(
                                    fontSize: 20,
                                    color: Color(0xff949494),
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                SizedBox(width: 10.0),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              margin: EdgeInsets.only(bottom: 40, left: 45),
              width: 300,
              height: 53,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff78A9EF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () => {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomePage())
                  )
                },
                child: Text(
                  "Get Started",
                  style: GoogleFonts.nunito(
                    fontSize: 18, 
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}