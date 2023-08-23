import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/src/features/home/data/models/pokemon.dart';
import 'package:pokedex/src/features/home/domain/repositories/repository.dart';
import 'package:pokedex/src/features/home/domain/use_cases/get_pokemons.dart';

import 'get_pokemons_test.mocks.dart';

@GenerateMocks([Repository])
void main() {
  const int pokemonCount = 20;
  late Repository mockRepo;
  late List<Pokemon> pokemons;
  late GetPokemonsCase getPokemonsCase;

  setUp(() {
    pokemons = List.generate(
        pokemonCount,
        (index) => Pokemon(
              id: index,
              name: 'Pokemon $index',
              imageUrl: 'imageUrl',
              height: 8,
              weight: 20,
              stats: const [],
              types: const [],
            ));
    mockRepo = MockRepository();
    getPokemonsCase = GetPokemonsCase(mockRepo);
  });

  test("Should return a list of pokemons from Repository", () async {
    verifyZeroInteractions(mockRepo);

    //When [GetPokemonsCase] is called, it should return the [Right] of
    //the Either argument.
    when(mockRepo.getPokemons()).thenAnswer(
      (_) async => Right(pokemons),
    );

    final data = await getPokemonsCase.call();

    expect(data, Right(pokemons));
    expect((data as Right<String, List<Pokemon>>).value.length,
        equals(pokemonCount));

    // Verify that the function was called on the repo
    verify(mockRepo.getPokemons()).called(1);

    //Verify no other method was called on the repo.
    verifyNoMoreInteractions(mockRepo);
  });
}
