import 'package:flutter/material.dart';
import 'package:my_app/components/nft_thumbnail.dart';
import 'package:my_app/models/models.dart';

class NftGridView extends StatefulWidget {
  final List<NFT> nfts;

  const NftGridView({
    Key? key,
    required this.nfts,
  }) : super(key: key);

  @override
  State<NftGridView> createState() => _NftGridViewState();
}

class _NftGridViewState extends State<NftGridView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blueAccent, Colors.lightBlue]),
          backgroundBlendMode: BlendMode.colorBurn),
      child: GridView.builder(
        itemCount: widget.nfts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemBuilder: (context, index) {
          final nft = widget.nfts[index];
          return NftThumbnail(nft: nft);
        },
      ),
    );
  }
}
