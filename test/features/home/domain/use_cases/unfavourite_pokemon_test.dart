import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/src/features/home/domain/repositories/repository.dart';
import 'package:pokedex/src/features/home/domain/use_cases/unfavourite_pokemon_case.dart';

import 'get_pokemons_test.mocks.dart';

@GenerateMocks([Repository])
void main() {
  late UnFavouritePokemonCase unFavouritePokemonCase;
  late MockRepository mockRepo;

  setUp(() {
    mockRepo = MockRepository();
    unFavouritePokemonCase = UnFavouritePokemonCase(mockRepo);
  });

  test("should unfavourite the pokemon and add to the store", () async {
    // ignore: avoid_returning_null_for_void
    when(mockRepo.unFavourite(0)).thenAnswer((_) async => null);

    await unFavouritePokemonCase.call(0);

    verify(mockRepo.unFavourite(0)).called(1);

    verifyNoMoreInteractions(mockRepo);
  });
}
