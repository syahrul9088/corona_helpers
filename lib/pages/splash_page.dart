import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({ Key? key }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){

    Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, '/onboard'), );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2B2B4B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 196,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                  'assets/images/png/splash_page.png'
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25  ,
            ),
            Container(
              child: Text(
                'CORONA HELPERS',
                style: GoogleFonts.nunito(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w800
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}