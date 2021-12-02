import 'package:dio/dio.dart';
import 'package:kode_rick_and_morty/models/detailed_character.dart';
import 'package:kode_rick_and_morty/models/paginated_characters.dart';

abstract class Repository {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: "https://rickandmortyapi.com/api",
    ),
  );

  static Future<PaginatedCharacters> getCharacters(int page) async {
    var response = await _dio.get("/character/?page=$page");
    return PaginatedCharacters.fromJson(response.data);
  }

  static Future<DetailedCharacter> getCharacterDetails(int characterId) async {
    var response = await _dio.get("/character/$characterId");
    return DetailedCharacter.fromJson(response.data);
  }

  static Future<DetailedEpisode> getEpisodeDetails(int episodeId) async {
    var response = await _dio.get("/episode/$episodeId");
    return DetailedEpisode.fromJson(response.data);
  }
}
