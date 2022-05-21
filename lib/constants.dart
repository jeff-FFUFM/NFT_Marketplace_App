// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
export 'package:my_app/components/components.dart';
export 'package:my_app/models/models.dart';

const Color kBlack = Colors.black;
const Color kWhite = Colors.white;
const Color kWhite70 = Colors.white70;
const Color bagColorOff = Color.fromRGBO(224, 64, 251, 1);
const Color bagColorOn = Color.fromRGBO(13, 71, 161, 1);

const EdgeInsets kMarginAll10 = EdgeInsets.all(10);
const EdgeInsets kMarginAll20 = EdgeInsets.all(20);
const EdgeInsets kMarginAll30 = EdgeInsets.all(30);

BoxDecoration kBoxDecorationTotal =
    BoxDecoration(color: Colors.pink[800], borderRadius: BorderRadius.circular(30));

const kTextStyleSubtotal = TextStyle(
  fontFamily: 'Times New Roman',
  fontSize: 17,
  color: Colors.white,
  letterSpacing: 0.2,
  shadows: [
    Shadow(color: Colors.white, offset: Offset(0.2, 0.2), blurRadius: 0.3),
    Shadow(color: Colors.black, offset: Offset(0.2, 0.2), blurRadius: 0.3),
  ],
);
const kTextStyleTotal = TextStyle(
  fontFamily: 'Times New Roman',
  fontSize: 18,
  color: kWhite,
  fontWeight: FontWeight.w700,
  letterSpacing: 0.3,
  shadows: [
    Shadow(color: Colors.white, offset: Offset(0.2, 0.2), blurRadius: 0.3),
    Shadow(color: Colors.black, offset: Offset(0.2, 0.2), blurRadius: 0.3),
  ],
);

const kNftTitleTextStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'Roboto', shadows: [
  Shadow(color: Colors.black, offset: Offset(0.45, 0.45), blurRadius: 0.3),
  Shadow(color: Colors.white, offset: Offset(0.45, 0.45), blurRadius: 0.3),
]);

Icon EthereumIcon = Icon(
  FontAwesomeIcons.ethereum,
  color: Colors.deepPurple[800],
);

Icon EthereumIconLight = Icon(
  FontAwesomeIcons.ethereum,
  color: Colors.deepPurple[400],
);

const mainNetworkTextStyle = TextStyle(
    fontFamily: 'Arial', fontWeight: FontWeight.w500, fontSize: 15.5, color: Color.fromRGBO(97, 97, 97, 1));

const confirmTextStyle = TextStyle(
  fontFamily: 'Arial',
  fontWeight: FontWeight.w700,
  fontSize: 40,
  color: Colors.black,
);

const jamTextStyle = TextStyle(
  color: Color.fromRGBO(158, 158, 158, 1),
  fontSize: 13,
  fontFamily: 'Arial',
);

const metamaskDivider = Divider(
  thickness: 1,
  color: Colors.grey,
);

final ButtonStyle payWithMetamaskButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFE8100)),
  overlayColor: MaterialStateProperty.all<Color>(const Color(0xFFFF7100)),
);

final appBarTitle = RichText(
    text: const TextSpan(
        text: 'NFT COLLECTIONS',
        style: TextStyle(
            color: Color.fromARGB(255, 54, 144, 218),
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(color: Colors.black, offset: Offset(0.45, 0.45), blurRadius: 3),
              Shadow(color: Colors.lightBlue, offset: Offset(0.45, 0.45), blurRadius: 3),
            ]),
        children: [
      TextSpan(
          text: '   (Not for sale)',
          style: TextStyle(
              color: Color(0xFABDBDBD),
              fontFamily: 'Roboto',
              fontSize: 17,
              fontWeight: FontWeight.w600,
              shadows: [
                Shadow(color: Colors.grey, offset: Offset(0.45, 0.45), blurRadius: 3),
                Shadow(color: Colors.black, offset: Offset(1, 1), blurRadius: 3),
              ]))
    ]));
