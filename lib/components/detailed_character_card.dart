import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kode_rick_and_morty/models/detailed_character.dart';
import 'package:kode_rick_and_morty/theme/app_colors.dart';

class DetailedCharacterCard extends StatelessWidget {
  const DetailedCharacterCard({
    Key? key,
    required this.detailedCharacter,
    //required this.detailedEpisode,
  }) : super(key: key);

  final DetailedCharacter detailedCharacter;
  //final DetailedEpisode detailedEpisode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      width: MediaQuery.of(context).size.width,
      child: MediaQuery.removeViewInsets(
        removeTop: true,
        context: context,
        child: Card(
          color: AppColors.primaryColorLight,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 7.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Image.network(
                    detailedCharacter.image,
                    fit: BoxFit.fitWidth,
                    height: 180,
                    width: 330,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Text(
                        "${detailedCharacter.name.toUpperCase()}",
                        style: TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      child: Text(
                        "${detailedCharacter.status} - ${detailedCharacter.species} ",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Text(
                        "Last Known Location:",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 4),
                      child: Text(
                        "${detailedCharacter.location.name}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Text(
                        "First seen in:",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 20),
                      child: Text(
                        "${detailedCharacter.firstEpisode}° episode",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
