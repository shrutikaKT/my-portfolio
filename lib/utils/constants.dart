import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Constants {
  final List headerList = ['Hello', 'About', 'Experience', 'Portfolio'];
  final String fontFamily = 'JetBrainsMono';
  final List<String> skills = ['Flutter Web', 'Firebase', 'CI/CD Setup'];
  final String email = 'tatkare99shruti@gmail.com';
  final String projectKey = 'Featured Project';
  final String lightMode = 'Light Mode';
  final String darkMode = 'Dark Mode';
  final String responsibilies = 'Responsibilities';
  final String footerTitle = '04. What\'s Next?';
  final String connect = 'Let\'s Connect';
  final String touch = 'Get In Touch';
  final String mydetails =
      'With over 7+ years of experience in mobile app development, I specialize in building high-quality applications, particularly using Flutter Framework. I have a strong background in both technical execution and leadership, effectively managing teams and ensuring timely project delivery.';
  final String aboutme = 'About Me';
  final String myName = 'Hi, my name is';
  final String me = 'Shrutika Tatkare';
  final String builds = 'I build ';
  final String skillsList =
      'Here are a few technologies I\'ve been working with recently :';
  final String intro =
      'Hi, my name is Shrutika Tatkare, and I have a deep passion for creating mobile apps. Even in my busy schedule, I find joy in exploring innovative ideas that enhance user experiences. My journey in mobile app development began in 2017 when I decided to dive into building engaging and impactful applications.\n\nFast-forward to today, I\'ve had the privilege of working at Apptware Solutions LLP, a startup where I focused on designing and developing powerful mobile applications. My goal is to craft apps that not only look great but also deliver seamless performance, ensuring an exceptional user experience.';
  final List<Map<String, String>> experiances = [
    {
      'overview':
          '-> Supervised flutter junior developers\n-> developed mobile app features\n-> integrated third-party libraries (payment gateways, Firebase, SDKs)\n-> Ensured app stability with testing, code reviews, and CI/CD\n-> Ability to provide best solution for the services using impactful tools such as LaunchDarkly, Amplitude etc.',
      'company': 'Apptware Solutions LLP',
      'designation': 'Lead Mobile Developer',
      'year': 'July 2020 - Present'
    },
    {
      'overview':
          '-> Led the team in bug fixing & maintained deadlines\n-> Handled full front-to-back development using Firebase and Firestore\n-> Managed Firebase hosting and function deployment\n-> Integrated One Signal API for push notifications across platforms\n-> Published Android and iOS apps on respective stores.',
      'company': 'Eiosys Pvt Ltd',
      'designation': 'Hybrid Mobile App Developer',
      'year': 'April 2018 - May 2020'
    },
    {
      'overview':
          '-> Implemented REST API services for CRUD operations\n-> Developed native Android apps using Android Studio and connected the frontend to the database via PHP\n-> Worked on mobile UI and functionality\n-> Gained hands-on experience with MongoDB\n-> Utilized Facebook and Google APIs\n-> Also, proficient in JavaScript, TypeScript, and Angular.',
      'company': 'Wisdom Sprouts',
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
      'tech': ['Flutter', 'Firebase', 'Web Socket'],
      'link': 'https://play.google.com/store/apps/details?id=com.devaseva.app',
      'image': 'assets/images/project2.png'
    },
    {
      'name': 'Apptmart : E-com product',
      'description':
          'This is an e-commerce product by Apptware, designed to make app development easy for e-commerce businesses. Customers can simply request an app, provide some basic details, and the app is automatically generated and ready for publication — all without writing any additional code. The mobile app is fully dynamic, designed, and developed to meet the specific needs of e-commerce businesses.',
      'tech': ['Flutter', 'Payment Gateways', 'Hive'],
      'link': '',
      'image': 'assets/images/project3.png'
    }
  ];

  final List<Map<String, dynamic>> socialIcons = [
    // {"icon": FontAwesomeIcons.facebook, "link": ""},
    {"icon": FontAwesomeIcons.github, "link": "https://github.com/shrutikaKT"},
    // {"icon": FontAwesomeIcons.instagram, "link": ""},
    {"icon": FontAwesomeIcons.whatsapp, "link": "https://wa.me/917057110312"},
    {
      "icon": FontAwesomeIcons.linkedin,
      "link": "https://www.linkedin.com/in/shrutika-tatkare-ab7b27147"
    },
  ];
}
