import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CallUsScreen extends StatelessWidget {
  const CallUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'جريدة إلكترونية مستقلة متجددة على مدار الساعة',
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'ElMessiri',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'البريد الالكتروني :',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Tajawal',
                  ),
                ),
                SelectableText(
                  "imou.media@gmail.com",
                  style: GoogleFonts.lato(
                    fontSize: 19,
                    color: const Color(0xff144CE4),
                  ),
                  textAlign: TextAlign.center,
                  toolbarOptions: const ToolbarOptions(
                    copy: true,
                    selectAll: true,
                  ),
                  onTap: () async {
                    var email = "imou.media@gmail.com";
                    var emailurl = "mailto:$email";
                    await launch(emailurl);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'هاتف الادارة :',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Tajawal',
                  ),
                ),
                SelectableText(
                  "212664681884+",
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    color: const Color(0xff144CE4),
                  ),
                  textAlign: TextAlign.center,
                  toolbarOptions: const ToolbarOptions(
                    copy: true,
                    selectAll: true,
                  ),
                  onTap: () async {
                    var telurl = "tel:+212 664-681884";
                    await launch(telurl);
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Text(
                  'عنوان الادارة :',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Tajawal',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SelectableText(
                  "ABDERRAHIM BOUABID N°17 IMM AMSKROUD\nSIDI YOUSSEF AGADIR 80 Agadir, Morocco",
                  style: GoogleFonts.mavenPro(
                    fontSize: 16,
                    color: const Color(0xff144CE4),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Image.asset(
              'assets/images/icon.png',
            ),
          ],
        ),
      ),
    );
  }
}
