import 'package:flutter/material.dart';
import 'package:my_app/models/models.dart';

class NftCategoriesList extends StatefulWidget {
  final List<Category> categoryExpandedImagesList;
  const NftCategoriesList({
    Key? key,
    required this.categoryExpandedImagesList,
  }) : super(key: key);

  @override
  State<NftCategoriesList> createState() => _NftCategoriesListState();
}

class _NftCategoriesListState extends State<NftCategoriesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Column(
            children: [Image.asset(widget.categoryExpandedImagesList[index].backgroundImage)],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: widget.categoryExpandedImagesList.length,
    );
  }
}
