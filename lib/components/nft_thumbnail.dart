import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/constants.dart';

class NftThumbnail extends StatefulWidget {
  final NFT nft;
  final String title;
  final String price;
  Color bagColor;
  bool isInCart;

  NftThumbnail({
    Key? key,
    required this.nft,
    this.title = '',
    this.price = '',
    this.bagColor = bagColorOff,
    this.isInCart = false,
  }) : super(key: key);

  @override
  State<NftThumbnail> createState() => _NftThumbnailState();
}

class _NftThumbnailState extends State<NftThumbnail> {
  bool isListEqual(List<Item> a, List<Item> b) {
    bool contentTest =
        a.any((element) => b.any((i) => element.productName == i.productName)); // double iteration
    bool lengthTest = a.length == b.length;
    bool isEqual = contentTest && lengthTest;
    return isEqual;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              child: GestureDetector(
                child: Image.asset(
                  widget.nft.dishImage,
                  fit: BoxFit.fill, //fill original
                  width: 350,
                  height: 300,
                ),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.nft.title,
                maxLines: 1,
                style: kNftTitleTextStyle,
              ),
              CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.1),
                radius: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        item.itemsList.clear();
                        if (finalCartItems.any((element) => element.productName == widget.nft.title) ||
                            finalCartItems.any((element) => element.productName == widget.nft.title) ||
                            widget.isInCart) {
                          print('PASS THRU'); //testing
                          print('widget name: ${widget.nft.title}');
                          print('Item productname: ${item.productName}');
                          print('Finalcart productname: ${finalCartItems.last.productName}\n');
                        } else if (finalCartItems.any((e) => e.productName != widget.nft.title) ||
                            finalCartItems.isEmpty) {
                          item = Item(
                            imageName: widget.nft.id,
                            productName: widget.nft.title,
                            productPrice: widget.nft.price,
                          );
                          cartItems.add(item);

                          finalCartItems = cartItems.toList();
                          print('items in itemslist = ${item.itemsList.length}');
                          print('Cart Items : $cartItems, finalCartItems: $finalCartItems');
                          print(
                              'Cart Items length: ${cartItems.length}, FCI Length: ${finalCartItems.length}');
                          print('added item ${widget.nft.title}, ${widget.nft.price}\n'); //testing
                        }

                        if (widget.bagColor == bagColorOff) {
                          widget.bagColor = bagColorOn;
                          widget.isInCart = true;
                        } else {
                          finalCartItems.removeWhere((item) => item.productName == widget.nft.title);
                          cartItems.removeWhere((item) => item.productName == widget.nft.title);
                          print('Item removing');
                          widget.bagColor = bagColorOff;
                          widget.isInCart = false;
                          item.itemsList.clear();
                          setState(() {
                            item.itemsList.clear();
                          });
                        }
                      });
                    },
                    child: Icon(
                      FontAwesomeIcons.bagShopping,
                      color: finalCartItems.any((element) => element.productName == widget.nft.title)
                          ? bagColorOn
                          : bagColorOff,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                widget.nft.price,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.deepPurple,
                    fontFamily: 'Roboto',
                    shadows: [
                      Shadow(
                        color: Colors.purple.shade50,
                        offset: const Offset(0.3, 0.3),
                        blurRadius: 1,
                      ),
                      const Shadow(
                        color: Colors.deepPurple,
                        offset: Offset(0.3, 0.3),
                        blurRadius: 0.3,
                      ),
                    ]),
              ),
              Icon(
                FontAwesomeIcons.ethereum,
                color: Colors.deepPurple[600],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
