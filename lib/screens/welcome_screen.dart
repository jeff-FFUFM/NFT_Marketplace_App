import 'package:flutter/material.dart';
import 'package:my_app/api/nft_service.dart';
import 'package:my_app/components/components.dart';
import 'package:my_app/models/models.dart';
import 'package:my_app/components/welcome_page.dart';

class WelcomeScreen extends StatelessWidget {
  final nftService = NftService();
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: nftService.getNftCategories(),
        builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //
            return NftList(
              categoryList: snapshot.data ?? [],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
