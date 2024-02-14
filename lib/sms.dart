import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class SMS extends StatefulWidget{
  const SMS({super.key});

  @override
  State<SMS> createState() => _SMSState();
}

class _SMSState extends State<SMS> {
  String number = '';
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
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('SMS Sender'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                onEditingComplete: (){
                  setState(() {
                    number = controller.text;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Center(
                child: ElevatedButton(
                  onPressed: () {
                    sendSms(number, 'Check out our web app: https://www.google.com');
                  },
                  child: const Text('Send SMS'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}