import 'package:url_launcher/url_launcher.dart';

isOdd(int number) => !(number % 2 == 0);

launchURL(String url) async {
   final Uri url0 = Uri.parse(url);
   if (!await launchUrl(url0)) {
        throw Exception('Could not launch $url0');
    }
}