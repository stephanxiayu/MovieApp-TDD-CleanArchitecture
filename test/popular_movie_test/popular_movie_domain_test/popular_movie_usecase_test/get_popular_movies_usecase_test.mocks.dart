// Mocks generated by Mockito 5.4.3 from annotations
// in clean_movie/test/popular_movie_test/popular_movie_domain_test/popular_movie_usecase_test/get_popular_movies_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:clean_movie/core/errors/server_failure/server_failure.dart'
    as _i5;
import 'package:clean_movie/features/popular_movie/domian/entities/movie_entity.dart'
    as _i6;
import 'package:clean_movie/features/popular_movie/domian/repositories/movie_repository.dart'
    as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
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

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i3.MovieRepository {
  @override
  _i4.Future<
      _i2.Either<_i5.Failure,
          List<_i6.MovieEntity>>> getPopularMovies() => (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.MovieEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.MovieEntity>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.MovieEntity>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.MovieEntity>>(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.MovieEntity>>>);
}
