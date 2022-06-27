import 'package:flutter/material.dart';

class FiturPencegahan extends StatefulWidget {
  const FiturPencegahan({Key? key}) : super(key: key);

  @override
  State<FiturPencegahan> createState() => _FiturPencegahanState();
}

class _FiturPencegahanState extends State<FiturPencegahan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: const Color(0xffE1EBF1),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.42,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
              ),
              Padding(
                padding:const  EdgeInsets.all(30),
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon:const  Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 20,
                      ),
                      child: Image.asset(
                        'assets/images/png/fitur_pencegahan.png',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      alignment: Alignment.bottomCenter,
                      child: const Text(
                        'Jangan diri dan keluarga\ndari virus corona',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.41),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Jangan lupa untuk\nselalu menerapkan 5m',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                '1. Memakai Masker dengan Benar, Hidung dan Mulut Tertutup\n2. Mencuci tangan dengan sabun atau alkohol 70 %\n3. Menjaga Jarak Setidaknya 1-2 Meter dari orang lain\n4. Menghindari Kerumunan\n5. Membatasi Mobilitas atau Pergerakan',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),
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
