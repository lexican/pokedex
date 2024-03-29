// Mocks generated by Mockito 5.4.1 from annotations
// in pokedex/test/features/home/domain/use_cases/get_pokemons_test.dart.
// Do not manually edit this file.

// @dart=2.19

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:pokedex/src/features/home/data/models/pokemon.dart' as _i5;
import 'package:pokedex/src/features/home/domain/repositories/repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Repository].
///
/// See the documentation for Mockito's code generation for more information.
class MockRepository extends _i1.Mock implements _i3.Repository {
  MockRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<String, List<_i5.Pokemon>>> getPokemons({
    int? offset,
    int? limit,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPokemons,
          [],
          {
            #offset: offset,
            #limit: limit,
          },
        ),
        returnValue: _i4.Future<_i2.Either<String, List<_i5.Pokemon>>>.value(
            _FakeEither_0<String, List<_i5.Pokemon>>(
          this,
          Invocation.method(
            #getPokemons,
            [],
            {
              #offset: offset,
              #limit: limit,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<String, List<_i5.Pokemon>>>);
  @override
  _i4.Future<_i2.Either<String, List<_i5.Pokemon>>> getSavedPokemons() =>
      (super.noSuchMethod(
        Invocation.method(
          #getSavedPokemons,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<String, List<_i5.Pokemon>>>.value(
            _FakeEither_0<String, List<_i5.Pokemon>>(
          this,
          Invocation.method(
            #getSavedPokemons,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<String, List<_i5.Pokemon>>>);
  @override
  _i4.Future<void> favourite(int? id) => (super.noSuchMethod(
        Invocation.method(
          #favourite,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> unFavourite(int? id) => (super.noSuchMethod(
        Invocation.method(
          #unFavourite,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}
