import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/components/metamask_page.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  void showCart() {
    item.getItems();
  }

  String _totalCostETH() {
    final String total = (cartItemsPrices.last + item.itemsList.length * 0.005).toStringAsFixed(3);
    return total;
  }

  String _mintingFeeETH() {
    final String total = (item.itemsList.length * 0.005).toStringAsFixed(3);
    return total;
  }

  @override
  Widget build(BuildContext context) {
    item.getItems();
    if (item.itemsList.isNotEmpty) {
      return RefreshIndicator(
        color: Colors.white70,
        onRefresh: () {
          return Future.delayed(const Duration(milliseconds: 800), () {
            setState(() {
              item.getItems();
            });
          });
        },
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        child: ListView(
          children: [
            Column(
              children: [
                Column(
                  children: item.getItems(),
                ),
                const Divider(
                  color: kWhite,
                ),
                Container(
                  height: 120,
                  width: 400,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: kBoxDecorationTotal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Subtotal: ',
                            style: kTextStyleSubtotal,
                          ),
                          Row(
                            children: [
                              Text(
                                cartItemsPrices.isNotEmpty
                                    ? cartItemsPrices.last.toStringAsFixed(3)
                                    : '0.000',
                                style: kTextStyleSubtotal,
                              ),
                              EthereumIconLight,
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Minting Fee: ',
                            style: kTextStyleSubtotal,
                          ),
                          Row(
                            children: [
                              Text(
                                _mintingFeeETH(),
                                style: kTextStyleSubtotal,
                              ),
                              EthereumIconLight,
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        height: 20,
                        thickness: 2,
                        color: Colors.white70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'TOTAL: ',
                            style: kTextStyleTotal,
                          ),
                          Row(
                            children: [
                              Text(
                                _totalCostETH(),
                                style: kTextStyleTotal,
                              ),
                              EthereumIconLight,
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MetaMask(),
                      ),
                    );
                    setState(() {
                      item.getItems();
                    });
                  },
                  style: payWithMetamaskButtonStyle,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Pay via Metamask '),
                      Image.asset(
                        'images/metamask.png',
                        scale: 33,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/empty_list.png'),
            const Text('EMPTY CART'),
            const SizedBox(
              height: 5,
            ),
            const Text('Browse items in the marketplace'),
          ]);
    }
  }
}

Item item = Item(
  imageName: '',
  productName: '',
  productPrice: '',
);

class Item extends StatelessWidget {
  final String imageName;
  final String productName;
  final String productPrice;
  Color bagColor;
  bool isInCart = false;
  double cartTotalPrice = 0;
  List<Item> itemsList = List.empty(growable: true);

  Item({
    Key? key,
    required this.imageName,
    required this.productName,
    required this.productPrice,
    this.bagColor = bagColorOff,
  }) : super(key: key);

  //* Compares if list A and list B has the same contents.
  bool isListEqual(List a, List b) {
    bool contentTest = a.toSet().difference(b.toSet()).isEmpty;
    bool lengthTest = a.length == b.length;
    bool isEqual = contentTest && lengthTest;
    return isEqual;
  }

  List<Item> getItems() {
    item.itemsList.clear();
    finalCartItems = cartItems.toList();
    print('Number of cart items: ${cartItems.length}');
    print('Number of finalCartItems: ${finalCartItems.length}');

    if (!isListEqual(finalCartItems, item.itemsList)) {
      //* Length lang since isang beses lang pwede bilin yung nft
      cartTotalPrice = 0;
      for (int i = 0; i < finalCartItems.length; i += 1) {
        itemsList.add(Item(
          imageName: finalCartItems[i].imageName,
          productName: finalCartItems[i].productName,
          productPrice: finalCartItems[i].productPrice,
        ));
        cartTotalPrice += double.parse(finalCartItems[i].productPrice);
        cartItemsPrices.add(cartTotalPrice);
      }
    }

    finalCartItems.isEmpty ? cartItemsPrices.add(0) : null;
    return itemsList;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Dismissible(
        background: Container(
          color: Colors.red,
          child: const Text(
            'Delete  ',
            style: TextStyle(color: Colors.white),
          ),
          alignment: Alignment.centerRight,
        ),
        key: Key(productName),
        onDismissed: (DismissDirection direction) {
          cartItems.removeWhere((element) => element.productName == productName);
        },
        direction: DismissDirection.endToStart,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      margin: const EdgeInsets.all(10),
                      width: 90,
                      height: 80,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
                      child: Image.asset(
                        'assets/nft/$imageName',
                        fit: BoxFit.fill,
                      )),
                  Text(productName),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(productPrice),
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: EthereumIconLight,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    height: 93,
                    width: 5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Set<Item> cartItems = {};
List<double> cartItemsPrices = List.empty(growable: true);
List<Item> finalCartItems = List.empty(growable: true);
