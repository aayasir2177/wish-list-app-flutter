import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';
import 'package:string_capitalize/string_capitalize.dart';
import 'package:wish_list_app/providers/favorite_provider.dart';
import 'package:wish_list_app/screens/wish_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> words = nouns.take(50).toList();
    Provider.of<FavoriteProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("List"),
        centerTitle: true,
      ),
      body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: words.length,
          itemBuilder: (context, index) {
            String word = words[index];
            return ListTile(
              title: Text(word.capitalizeEach()),
              trailing: Consumer<FavoriteProvider>(
                builder: (context, value, child) {
                  return IconButton(
                      onPressed: () {
                        value.toglleFavorite(word);
                      },
                      icon: value.doesExist(word)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_border));
                },
              ),
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            final route =
                MaterialPageRoute(builder: (_) => const WishListScreen());
            Navigator.push(context, route);
          },
          label: const Text("Go to Wish List")),
    );
  }
}
