import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/src/features/home/domain/repositories/repository.dart';
import 'package:pokedex/src/features/home/domain/use_cases/favourite_pokemon_case.dart';

import 'get_pokemons_test.mocks.dart';

@GenerateMocks([Repository])
void main() {
  late FavouritePokemonCase favouritePokemonCase;
  late MockRepository mockRepo;

  setUp(() {
    mockRepo = MockRepository();
    favouritePokemonCase = FavouritePokemonCase(mockRepo);
  });

  test("should favourite the pokemon and add to the store", () async {
    // ignore: avoid_returning_null_for_void
    when(mockRepo.favourite(0)).thenAnswer((_) async => null);

    await favouritePokemonCase.call(0);

    verify(mockRepo.favourite(0)).called(1);

    verifyNoMoreInteractions(mockRepo);
  });
}
