import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Constants {
  final List headerList = ['Hello', 'About', 'Experiance', 'Portfolio'];
  final String fontFamily = 'JetBrainsMono';
  final List<String> skills = ['Flutter', 'Firebase', 'Ionic Framework'];
  final List<Map<String, String>> experiances = [
    {
      'overview':
          'Supervised junior developers, developed mobile app features, integrated third-party libraries (payment gateways, Firebase, SDKs), and managed theming and flavors. Led R&D for new features, ensured app stability with testing, code reviews, and CI/CD. Provided feature estimations, integrated services like speech-to-text, and handled payment gateway integrations.',
      'company':'Apptware Solutions LLP',
      'designation': 'Lead Mobile Developer',
      'year': 'July 2020 - Present'
    },
    {
      'overview':
          'Led the team in bug fixing, maintained deadlines, and handled full front-to-back development using Firebase and Firestore. Managed Firebase hosting and function deployment, integrated One Signal API for push notifications across platforms, and published Android and iOS apps on respective stores.',
            'company':'Eiosys Pvt Ltd',
      'designation': 'Hybrid Mobile App Developer',
      'year': 'April 2018 - May 2020'
    },
    {
      'overview':
          'Implemented REST API services for CRUD operations, developed native Android apps using Android Studio, and connected the frontend to the database via PHP. Worked on mobile UI and functionality, gained hands-on experience with MongoDB, and utilized Facebook and Google APIs. Also, proficient in JavaScript, TypeScript, and Angular.',
            'company':'Wisdom Sprouts',
      'designation': 'Software Developer',
      'year': 'March 2017 - Febuary 2018'
    }
  ];
  final List<Map<String, dynamic>> projects = [
    {
      'name': 'JobWhiz: AI Interview Prep',
      'description':
          'The Interview Preparation Application is a revolutionary tool designed to assist job applicants in honing their interview skills. With a focus on leveraging the power of artificial intelligence and tailored question sets, the application offers users an opportunity to practice interview questions, receive feedback, and enhance their confidence during the job application process',
      'tech': ['Flutter', 'RevanueCat', 'LaunchDarkly'],
      'link': 'https://play.google.com/store/apps/details?id=com.whiz.app',
      'image': 'assets/images/project1.png'
    },
    {
      'name': 'Devaseva',
      'description':
          'Devaseva is one of the most trusted online Puja platforms of India that helps devotees connect with the divine digitally, book online Sevas and get them conducted in a hassle-free manner. You can also enjoy other benefits like you can book seva for your loved ones for blessings, you can watch live telecast, prasad delivery at your doorstep, read interesting news on feeds, donation can be done.',
      'tech': ['Flutter', 'Firebase'],
      'link': 'https://play.google.com/store/apps/details?id=com.devaseva.app',
      'image': 'assets/images/project2.png'
    },
    {
      'name': 'Apptmart : E-com product',
      'description':
          'This is an e-commerce product by Apptware, designed to make app development easy for e-commerce businesses. Customers can simply request an app, provide some basic details, and the app is automatically generated and ready for publication — all without writing any additional code. The mobile app is fully dynamic, designed, and developed to meet the specific needs of e-commerce businesses.',
      'tech': ['Flutter', 'Firebase'],
      'link': '',
      'image': 'assets/images/project3.png'
    }
  ];

  final List<Map<String, dynamic>> socialIcons = [
    // {"icon": FontAwesomeIcons.facebook, "link": ""},
    {"icon": FontAwesomeIcons.github, "link": "https://github.com/shrutika-tatkare-apptware"},
    // {"icon": FontAwesomeIcons.instagram, "link": ""},
    {"icon": FontAwesomeIcons.whatsapp, "link": "https://wa.me/917057110312"},
    {
      "icon": FontAwesomeIcons.linkedin,
      "link": "https://www.linkedin.com/in/shrutika-tatkare-ab7b27147"
    },
  ];
}
