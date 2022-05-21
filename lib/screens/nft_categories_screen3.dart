import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/api/nft_service.dart';
import '../components/nft_categories_gridview.dart';

class NftCategoriesScreen3 extends StatelessWidget {
  final nftService = NftService();
  NftCategoriesScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: nftService.getNftExpandedCategories3(),
        builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              appBar: AppBar(
                title: appBarTitle,
                centerTitle: true,
              ),
              body: NftCategoriesList(
                categoryExpandedImagesList: snapshot.data ?? [],
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
