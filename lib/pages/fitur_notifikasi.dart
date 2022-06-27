import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class getMessage {
  final String message;

  const getMessage(
    {
      required this.message, 

    }
  );

  factory getMessage.fromJson(Map<String, dynamic> json) {
    return getMessage(
      message: json["message"]
    );
  }
}

class FiturNotifikasi extends StatefulWidget {
  const FiturNotifikasi({Key? key}) : super(key: key);

  @override
  State<FiturNotifikasi> createState() => _FiturNotifikasiState();
}

class _FiturNotifikasiState extends State<FiturNotifikasi> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  late Future<getMessage> futureGetMessage;

  @override
  void initState() {
    super.initState();
    futureGetMessage = fetGetMessage(phoneController);
  }

  Future<getMessage> fetGetMessage(phoneController) async {
    final response = await http.get(Uri.parse("http://108.136.214.237:4000/chat/savePhone/" + phoneController));

    if (response.statusCode == 200) {
      return getMessage.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data!");
    }
  }

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
                padding: const EdgeInsets.all(30),
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(
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
                        'assets/images/png/fitur_notifikasi.png',
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.25,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      alignment: Alignment.bottomCenter,
                      child: const  Text(
                        'Dapatkan Notifkasi Kasus Corona\nyang akan  dikirimkan\nke nomor WhatsApp kamu.',
                        textAlign: TextAlign.center,
                        style:  TextStyle(
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
                            'Nomor WhatsApp',
                            textAlign: TextAlign.left,
                            style:  TextStyle(
                              fontSize: 20,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 1),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextFormField(
                                    controller: phoneController,
                                    autovalidateMode: 
                                    AutovalidateMode.onUserInteraction,
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                      hintText: 'Nomor WhatsApp Kamu',
                                      border: InputBorder.none,
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Nomor tidak boleh kosong';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: () async{
                                    if (_formKey.currentState!.validate()) {
                                      final response = await fetGetMessage(phoneController.text);
                                      _showMyDialog(response.message);
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color:const Color(0xff78A9EF),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    width: MediaQuery.of(context).size.width,
                                    child: const Center(
                                      child: Text(
                                        'Submit',
                                        style:  TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog(response) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    "${response}",
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
