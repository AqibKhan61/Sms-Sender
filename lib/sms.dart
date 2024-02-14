import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class SMS extends StatelessWidget{
  const SMS({super.key});

  void sendSms(String phoneNumber, String message) async {
  final Uri uri = Uri(
    scheme: 'sms',
    path: phoneNumber,
    queryParameters: {'body': message},
  );

  if (await canLaunch(uri.toString())) {
    await launch(uri.toString());
  } else {
    throw 'Could not launch SMS';
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS Sender'),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
            onPressed: () {
              sendSms('923111687177', 'Check out our web app: https://www.google.com');
            },
            child: const Text('Send SMS'),
          ),
        ),
    );
  }
}