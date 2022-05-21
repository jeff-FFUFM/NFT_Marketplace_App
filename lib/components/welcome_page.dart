import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/screens/nft_categories_screen.dart';
import 'package:my_app/screens/welcome_screen.dart';

import 'package:my_app/screens/nft_categories_screen2.dart';
import 'package:my_app/screens/nft_categories_screen3.dart';
import 'package:my_app/screens/nft_categories_screen4.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBlack,
      child: Column(
        children: [
          const RotatingNft(),
          Container(
              margin: const EdgeInsets.all(10),
              child: const Text(
                'Browse by Category',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              )),
          SizedBox(height: 300, child: WelcomeScreen()),
        ],
      ),
    );
  }
}

class NftList extends StatefulWidget {
  final List<Category> categoryList;
  const NftList({
    Key? key,
    required this.categoryList,
  }) : super(key: key);

  @override
  State<NftList> createState() => _NftListState();
}

class _NftListState extends State<NftList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      primary: false,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.categoryList[index].title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Macondo',
                  color: Colors.redAccent.shade400.withOpacity(0.8),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (widget.categoryList[index].id == '1') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NftCategoriesScreen(),
                      ),
                    );
                  } else if (widget.categoryList[index].id == '2') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NftCategoriesScreen2(),
                      ),
                    );
                  } else if (widget.categoryList[index].id == '3') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NftCategoriesScreen3(),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NftCategoriesScreen4(),
                      ),
                    );
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 0,
                    bottom: 0,
                    right: 20,
                    left: 20,
                  ),
                  width: 190,
                  height: 265,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      widget.categoryList[index].backgroundImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: widget.categoryList.length,
    );
  }
}

class RotatingNft extends StatelessWidget {
  const RotatingNft({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: 200,
            color: kBlack,
            child: TextButton(
              onPressed: () {},
              child: Image.asset(
                'assets/nft.gif',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Container(
          color: kBlack,
          height: 20,
        ),
      ],
    );
  }
}
