import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:my_app/constants.dart';

class MetaMask extends StatefulWidget {
  const MetaMask({Key? key}) : super(key: key);

  @override
  State<MetaMask> createState() => _MetaMaskState();
}

class _MetaMaskState extends State<MetaMask> {
  void clearAll() {
    item.itemsList.clear();
    finalCartItems.clear();
    cartItems.clear();
    cartItemsPrices.clear();
    cartItemsPrices.add(0);
  }

  void alert() {
    TextButton okButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Transaction Status'),
                  content: const Text(
                    'TRANSACTION SUCCESSFUL!',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                        setState(() {
                          clearAll();
                        });
                      },
                      child: const Text('OK'),
                    )
                  ],
                );
              });
        },
        child: const Text('OK'));
    TextButton cancelButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('Cancel'),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm Transaction'),
            content: const Text(
              'Are you sure you want to confirm this transaction? This cannot be undone.',
            ),
            actions: [cancelButton, okButton],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: const Icon(
                  Icons.circle,
                  color: Color(0xFF4aaf9d),
                  size: 12,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  right: 20,
                  top: 20,
                  bottom: 10,
                  left: 5,
                ),
                child: const Text(
                  'Main Network',
                  style: mainNetworkTextStyle,
                ),
                alignment: Alignment.centerRight,
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 23),
            width: 450,
            child: const Text(
              'Confirm',
              textAlign: TextAlign.left,
              style: confirmTextStyle,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 23),
            width: 450,
            child: Text(
              'Does your transaction look correct?',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Arial',
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          metamaskDivider,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    FontAwesomeIcons.solidCircleUser,
                    color: Colors.blue,
                    size: 30,
                  ),
                  Text(
                    '  Account 1',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
              const Icon(
                FontAwesomeIcons.solidCircleRight,
                size: 30,
                color: Colors.black26,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    FontAwesomeIcons.solidCircleUser,
                    color: Colors.yellow,
                    size: 30,
                  ),
                  Text(
                    '  0xe7bd...s2of  ',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          metamaskDivider,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 300,
                    height: 46,
                    child: Text(
                      '\$${(cartItemsPrices.last + item.itemsList.length * 0.005).toStringAsFixed(3)}',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        color: Colors.grey.shade700,
                        fontSize: 35,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      '${((cartItemsPrices.last + item.itemsList.length * 0.005) / 1950).toStringAsFixed(5)} ETH',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 22,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 9),
                    child: const Text(
                      '"JAM NFTS"',
                      style: jamTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
          metamaskDivider,
          Row(
            children: [
              Container(
                width: 195,
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 12,
                  bottom: 12,
                  right: 50,
                ),
                child: Text(
                  'From1:',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    color: Colors.grey.shade600,
                    fontSize: 20,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      'Account 1',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        color: Colors.grey.shade700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 49),
                    child: Text(
                      '....2412',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        color: Colors.grey.shade500,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          metamaskDivider,
          Row(
            children: [
              Container(
                width: 195,
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 12,
                  bottom: 12,
                  right: 110,
                ),
                child: Text(
                  'To:',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    color: Colors.grey.shade600,
                    fontSize: 20,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Text(
                      'JAM NFTS',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        color: Colors.grey.shade700,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 49),
                    child: Text(
                      '....5924',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        color: Colors.grey.shade500,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          metamaskDivider,
          Row(
            children: [
              Container(
                width: 195,
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 12,
                  bottom: 12,
                  right: 80,
                ),
                child: Text(
                  'Gas fee:',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    color: Colors.grey.shade600,
                    fontSize: 20,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text(
                      '\$5.27 USD',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'Arial',
                        color: Colors.grey.shade700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(
                      '0.00270 ETH',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        color: Colors.grey.shade500,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          metamaskDivider,
          Row(
            children: [
              Container(
                width: 195,
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 12,
                  bottom: 12,
                  right: 110,
                ),
                child: Text(
                  'Total:',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    color: Colors.grey.shade600,
                    fontSize: 20,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 73),
                    child: Text(
                      '\$${(cartItemsPrices.last + 5.27).toStringAsFixed(2)}',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        color: Colors.grey.shade700,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 49),
                    child: Text(
                      '${((cartItemsPrices.last) / 1950 + 0.0027).toStringAsFixed(5)} ETH',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        color: Colors.grey.shade500,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          metamaskDivider,
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.09),
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  height: 60,
                  width: 170,
                  child: Text(
                    'CANCEL',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      color: Colors.grey.shade700,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  alert();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 170,
                    color: const Color(0xFF489be2),
                    child: const Text(
                      'CONFIRM',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        color: Colors.white70,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
