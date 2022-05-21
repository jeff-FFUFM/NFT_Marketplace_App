import 'package:flutter/material.dart';
import 'package:my_app/models/models.dart';
import 'package:my_app/api/nft_service.dart';
import 'package:my_app/components/components.dart';

class NftScreen extends StatelessWidget {
  final nftService = NftService();
  NftScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: nftService.getNft(),
        builder: (BuildContext context, AsyncSnapshot<List<NFT>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            //
            return NftGridView(
              nfts: snapshot.data ?? [],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
