// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:pokedex/src/core/api/api_provider.dart';
// import 'package:pokedex/src/core/models/pokemon/pokemon.dart';
// import 'package:pokedex/src/core/services/api/api_service.dart';

// import 'api_provider_test.mocks.dart';

// @GenerateMocks([ApiProvider, ApiService])
// void main() {
//   const pokemonCount = 24;
//   late MockApiProvider mockApiProvider;
//   late dynamic pokemonsResponseMap;
//   late List<Pokemon> pokemons;
//   late MockApiService mockApiService;

//   setUp(() {
//     mockApiProvider = MockApiProvider();
//     pokemonsResponseMap = pokemonsResponseMap = {
//       'results': List.generate(
//           pokemonCount,
//           (index) =>
//               {'url': 'https://pokeapi.co/api/v2/pokemon/${index + 1}/'}),
//     };
//     pokemons = List.generate(20, (index) {
//       return Pokemon(
//         id: index + 1,
//         name: 'name',
//         imageUrl: 'imageUrl',
//         height: 8,
//         weight: 20,
//         stats: const [],
//         types: const [],
//       );
//     });
//     mockApiService = MockApiService();
//   });

//   test(
//       "Returns Map from ApiProvider and returns List<Pokemon> from ApiService ",
//       () async {
//     verifyZeroInteractions(mockApiProvider);
//     verifyZeroInteractions(mockApiService);
//     when(mockApiProvider.getPokemons(path: '/pokemon')).thenAnswer((_) {
//       return pokemonsResponseMap;
//     });

//     when(mockApiProvider.getPokemon(
//             path: 'https://pokeapi.co/api/v2/pokemon/1'))
//         .thenAnswer((_) {
//       dynamic result = {};
//       return result;
//     });

//     when(mockApiService.getPokemons(limit: 24, offset: 0)).thenAnswer((_) {
//       final result = List.generate(20, (index) {
//         return Pokemon(
//           id: index + 1,
//           name: 'name',
//           imageUrl: 'imageUrl',
//           height: 8,
//           weight: 20,
//           stats: const [],
//           types: const [],
//         );
//       });
//       return Future.delayed(const Duration(seconds: 2), () {
//         return result;
//       });
//     });
//     final result = await mockApiService.getPokemons(limit: 24, offset: 0);
//     expect(result, equals(pokemons));
//   });
//   verifyNoMoreInteractions(mockApiProvider);
//   verifyNoMoreInteractions(mockApiService);
// }
