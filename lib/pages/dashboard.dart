import 'package:corona_helpers/pages/fitur_kesehatan.dart';
import 'package:corona_helpers/pages/fitur_notifikasi.dart';
import 'package:corona_helpers/pages/fitur_pencegahan.dart';
import 'package:corona_helpers/pages/fitur_zona.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataCovid {
  final int jumlahPositif;
  final int jumlahSembuh;
  final int jumlahDirawat;
  final int jumlahMeninggal;

  const DataCovid(
    {
      required this.jumlahPositif, 
      required this.jumlahSembuh,
      required this.jumlahDirawat,
      required this.jumlahMeninggal,
    }
  );

  factory DataCovid.fromJson(Map<String, dynamic> json) {
    return DataCovid(
      jumlahPositif: json["update"]["total"]["jumlah_positif"], 
      jumlahSembuh: json["update"]["total"]["jumlah_sembuh"],
      jumlahDirawat: json["update"]["total"]["jumlah_dirawat"],
      jumlahMeninggal: json["update"]["total"]["jumlah_meninggal"]
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<DataCovid> futureDataCovid;

  @override
  void initState() {
    super.initState();
    futureDataCovid = fetchDataCovid();
  }

  Future<DataCovid> fetchDataCovid() async {
    final response = await http.get(Uri.parse("https://data.covid19.go.id/public/api/update.json"));

    if (response.statusCode == 200) {
      return DataCovid.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<DataCovid>(
        future: fetchDataCovid(),
        builder: (context, snapshot){
          if(snapshot.error != null){
            return Center(
              child: Text(
                "${snapshot.error}",
                style: TextStyle(fontSize: 35),
              ),
            );
          }

          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          } else {
            return(
              SingleChildScrollView(
                child: Column(
                  children: [
                    sizedBoxHeight(120.0),
                    const Center(
                      child: Text(
                        'Statistik Kasus Indonesia',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    sizedBoxHeight(20.0),
                    covidInfo('Sembuh', '${snapshot.data!.jumlahSembuh}', Colors.green),
                    sizedBoxHeight(10.0),
                    covidInfo('Terkonfirmasi', "${snapshot.data!.jumlahPositif}", Colors.yellow[300]!),
                    sizedBoxHeight(10.0),
                    covidInfo('Dalam Perawatan', '${snapshot.data!.jumlahDirawat}', Colors.redAccent[100]!),
                    sizedBoxHeight(10.0),
                    covidInfo('Meninggal', '${snapshot.data!.jumlahMeninggal}', Colors.red),
                    sizedBoxHeight(50.0),
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.7,
                          decoration: const BoxDecoration(
                            color: Color(0xffE1EBF1),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 30,
                            left: 30,
                          ),
                          child: Text(
                            'Apa yang kamu butuhkan ?',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                child: menu('assets/images/png/Chat1.png', 'Notifikasi'),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FiturNotifikasi()),
                                  );
                                },
                              ),
                              InkWell(
                                child: menu('assets/images/png/sytringe.png', 'Kesehatan'),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FiturKesehatan()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 270),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                child: menu('assets/images/png/chart.png', 'Zona Corona'),
                                onTap: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FiturZona()),
                                );
                                }, 
                              ),
                              InkWell(
                                child: menu('assets/images/png/Shield1.png', 'Pencegahan'),
                                onTap: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FiturPencegahan()),
                                );
                                }, 
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            );
          }
        },
      )
    );
  }

  Widget covidInfo(String parameter, String totalCount, Color colors) {

    final oCcy = new NumberFormat("#,##0", "en_US");

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            parameter,
            style: const TextStyle(
              fontFamily: 'Nunito',
              color: Colors.grey,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              Text(
                oCcy.format(int.parse(totalCount)),
                style: const TextStyle(
                  fontFamily: 'Nunito',
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: colors,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget menu(String assetImage, String menuTitle) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image.asset(
                assetImage,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
              sizedBoxHeight(16.0),
              Text(
                menuTitle,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  sizedBoxHeight(double height) {
    return SizedBox(height: height);
  }
}
