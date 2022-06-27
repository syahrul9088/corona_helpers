import 'package:flutter/material.dart';

class FiturKesehatan extends StatefulWidget {
  const FiturKesehatan({Key? key}) : super(key: key);

  @override
  State<FiturKesehatan> createState() => _FiturKesehatanState();
}

class _FiturKesehatanState extends State<FiturKesehatan> {
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
                        'assets/images/png/fitur_kesehatan.png',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      alignment: Alignment.bottomCenter,
                      child: const Text(
                        'Cek kesehatanmu sebelum berpergian\njauh agar orang disekitar mu\nmerasa aman dan nyaman',
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
                            'Pertanyaan',
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
                                'Apakah kamu pernah melakukan salah satu/lebih tindakan ini?\n1. Datang ke acara sosial baik budaya, olahraga atau keagamaan\n2. Melakukan wisata, liburan atau mudik selama pandemi\n3. Tidak memakai masker ataupun memakai masker dengan cara yang salah (contoh: hidung/mulut terbuka)\n4. Tidak menjaga jarak dengan orang lain\n5. Tidak mencuci tangan atau kerap menyentuh mata, hidung atau muka dengan tangan.',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  yesButton();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: const Color(0xff78A9EF),
                                  ),
                                 padding:const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                                  child: const Text(
                                    'Ya',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20,),
                              InkWell(
                                onTap: () {
                                  noButton();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                                  child: const Text(
                                    'Tidak',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color:Color(0xff78A9EF),
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
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

  Future<void> yesButton() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Center(
                  child: Text(
                    'Kamu termasuk golongan individu yang memiliki resiko tinggi untuk terkena COVID-19 karena tidak mematuhi protokol kesehatan yang baik dan benar',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff78A9EF),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                    child: const Text(
                      'Close',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> noButton() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Center(
                  child: Text(
                    'Kamu termasuk golongan individu yang memiliki resiko rendah untuk terkena COVID-19.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff78A9EF),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                    child: const Text(
                      'Close',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
