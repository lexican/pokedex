import 'package:dartz/dartz.dart';
import 'package:pokedex/src/core/api/api_client.dart';
import 'package:pokedex/src/core/api/api_result.dart';
import 'package:pokedex/src/core/constants/constants.dart';
import 'package:pokedex/src/core/locator/locator.dart';
import 'package:pokedex/src/core/models/pokemon/pokemon.dart';
import 'package:pokedex/src/features/home/data/data_sources/remote_data_sources/remote_data_source.dart';
import 'package:pokedex/src/utils/utils.dart';

class RemoteDataSourceImp implements RemoteDataSource {
  final ApiClient _apiClient = locator<ApiClient>();

  @override
  Future<Either<String, List<Pokemon>>> getPokemons(
      {int? offset, int? limit}) async {
    try {
      List<Pokemon> pokemons = [];
      ApiResult result = await _apiClient.get(
        pokemonsPath,
        parameters: {
          'offset': offset,
          'limit': 15,
        },
      );
      result.when(success: (data) async {
        final dataMap = (data['results'] as List).cast<Map>();
        await Future.wait(
          dataMap.map(
            (e) => _apiClient
                .get(
              getIdFromUrl(e['url']),
            )
                .then(
              (data) {
                data.when(
                  success: (data) {
                    Pokemon pokemon = Pokemon.fromJson(data);
                    pokemons.add(pokemon);
                    return data;
                  },
                  failure: (_) {},
                );
              },
            ),
          ),
        );

        return Right(
          pokemons,
        );
      }, failure: (error) {
        return Left(
          error,
        );
      });
    } catch (_) {}
    return const Left(
      "",
    );
  }
}
