import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wish_list_app/providers/favorite_provider.dart';
import 'package:string_capitalize/string_capitalize.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wish List"),
        centerTitle: true,
      ),
      body: Consumer<FavoriteProvider>(
        builder: (context, value, child) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: value.selectedItems.length,
              itemBuilder: (context, index) {
                String word = value.selectedItems[index];
                return ListTile(
                  title: Text(word.capitalizeEach()),
                  trailing: IconButton(
                      onPressed: () {
                        value.toglleFavorite(word);
                      },
                      icon: value.doesExist(word)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_border)),
                );
              });
        },
      ),
    );
  }
}
