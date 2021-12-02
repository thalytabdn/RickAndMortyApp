import 'package:flutter/material.dart';
import 'package:kode_rick_and_morty/components/app_bar_component.dart';
import 'package:kode_rick_and_morty/components/character_card.dart';
import 'package:kode_rick_and_morty/data/repository.dart';
import 'package:kode_rick_and_morty/models/paginated_characters.dart';
import 'package:kode_rick_and_morty/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<PaginatedCharacters>? characters;
  int page = 1;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    characters = Repository.getCharacters(page);
    scrollController.addListener(onScroll);
    super.initState();
  }

  void onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        page++;
        characters = Repository.getCharacters(page);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder(
          future: characters,
          builder: (context, AsyncSnapshot<PaginatedCharacters> snapshot) {
            if (snapshot.hasData) {
              final dataResults = snapshot.data!.results;
              return ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.symmetric(vertical: 7.5),
                itemBuilder: (context, index) {
                  return CharacterCard(
                    character: dataResults[index],
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/details',
                        arguments: dataResults[index].id,
                      );
                    },
                  );
                },
                itemCount: dataResults.length,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Ocorreu um erro.",
                  style: TextStyle(color: AppColors.white),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
