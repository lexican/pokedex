import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/src/core/api/api_client.dart';
import 'package:pokedex/src/core/constants/constants.dart';
import 'package:pokedex/src/core/models/pokemon/pokemon.dart';
import 'package:pokedex/src/core/utils/utils.dart';
import 'package:pokedex/src/features/home/data/data_sources/remote_data_sources/remote_data_source_imp.dart';
import 'remote_data_source.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  const pokemonCount = 10;
  late ApiClient mockApiClient;
  late Map<String, dynamic> pokemonsResponseMap;
  late RemoteDataSourceImp mockRemoteDataSourceImp;
  late Pokemon pokemon;
  late List<Pokemon> pokemons;

  setUp(() {
    logger.i("Setup");
    mockApiClient = MockApiClient();
    mockRemoteDataSourceImp = RemoteDataSourceImp(apiClient: mockApiClient);
    pokemon = Pokemon(
      id: 0,
      name: 'name',
      imageUrl: 'imageUrl',
      height: 8,
      weight: 20,
      stats: const [],
      types: const [],
    );
    pokemons = List.generate(pokemonCount, (index) => pokemon);
    pokemonsResponseMap = pokemonsResponseMap = {
      'results': List.generate(pokemonCount,
          (index) => {'url': 'https://pokeapi.co/api/v2/pokemon/1'}),
    };
  });

  group("Remote data source test", () {
    test("Should return pokemons", () async {
      // Get all pokemons
      when(mockApiClient.get(
        ApiConfig.pokemonsPath,
        parameters: {'offset': 0, 'limit': pokemonCount},
      )).thenAnswer((_) async {
        return Response(
          data: pokemonsResponseMap,
          requestOptions: RequestOptions(path: ''),
        );
      });

      //Get specific pokemon details
      when(mockApiClient.get('https://pokeapi.co/api/v2/pokemon/1',
              parameters: null))
          .thenAnswer((_) async {
        return Response(
          data: {
            'id': 0,
            'name': 'name',
            'sprites': {
              "other": {
                "official-artwork": {
                  "front_default": "imageUrl",
                }
              },
            },
            "height": 8,
            "weight": 20,
            "types": [],
            "stats": [],
          },
          requestOptions: RequestOptions(path: ''),
        );
      });

      final result = await mockRemoteDataSourceImp.getPokemons(
          offset: 0, limit: pokemonCount);

      result.fold((_) {}, (r) {
        expect(r.length, equals(pokemons.length));
        expect(r.every((e) => e == pokemon), isTrue);
      });

      verify(mockApiClient.get('https://pokeapi.co/api/v2/pokemon/1'))
          .called(pokemonCount);
    });
  });
}
