import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:my_app/models/models.dart';

//NFT service that grabs sample json data to mock nft request/ response
class NftService {
  //Batch request that gets nfts for marketplace

  Future<List<NFT>> getNft() async {
    await Future.delayed(const Duration(milliseconds: 700));
    final dataString = await _loadAsset('assets/sample_data/sample_nfts.json');
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['nfts'] != null) {
      final nfts = <NFT>[];
      json['nfts'].forEach((v) {
        nfts.add(NFT.fromJson(v));
      });
      return nfts;
    } else {
      return List.empty(growable: true);
    }
  }

  Future<List<Category>> getNftCategories() async {
    await Future.delayed(const Duration(milliseconds: 700));
    final dataString = await _loadAsset('assets/sample_data/sample_nft_categories.json');
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['nftCategories'] != null) {
      final nftCategories = <Category>[];
      json['nftCategories'].forEach((v) {
        nftCategories.add(Category.fromJson(v));
      });
      return nftCategories;
    } else {
      return List.empty(growable: true);
    }
  }

  Future<List<Category>> getNftExpandedCategories() async {
    await Future.delayed(const Duration(milliseconds: 700));
    final dataString = await _loadAsset('assets/sample_data/nft_expansion.json');
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['nftExpansionArt'] != null) {
      final nftExpansionArt = <Category>[];
      json['nftExpansionArt'].forEach((v) {
        nftExpansionArt.add(Category.fromJson(v));
      });
      return nftExpansionArt;
    } else {
      return List.empty(growable: true);
    }
  }

  Future<List<Category>> getNftExpandedCategories2() async {
    await Future.delayed(const Duration(milliseconds: 700));
    final dataString = await _loadAsset('assets/sample_data/nft_expansion.json');
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['nftExpansionArt2'] != null) {
      final nftExpansionArt2 = <Category>[];
      json['nftExpansionArt2'].forEach((v) {
        nftExpansionArt2.add(Category.fromJson(v));
      });
      return nftExpansionArt2;
    } else {
      return List.empty(growable: true);
    }
  }

  Future<List<Category>> getNftExpandedCategories3() async {
    await Future.delayed(const Duration(milliseconds: 700));
    final dataString = await _loadAsset('assets/sample_data/nft_expansion.json');
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['nftExpansionArt3'] != null) {
      final nftExpansionArt3 = <Category>[];
      json['nftExpansionArt3'].forEach((v) {
        nftExpansionArt3.add(Category.fromJson(v));
      });
      return nftExpansionArt3;
    } else {
      return List.empty(growable: true);
    }
  }

  Future<List<Category>> getNftExpandedCategories4() async {
    await Future.delayed(const Duration(milliseconds: 700));
    final dataString = await _loadAsset('assets/sample_data/nft_expansion.json');
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['nftExpansionArt4'] != null) {
      final nftExpansionArt4 = <Category>[];
      json['nftExpansionArt4'].forEach((v) {
        nftExpansionArt4.add(Category.fromJson(v));
      });
      return nftExpansionArt4;
    } else {
      return List.empty(growable: true);
    }
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
