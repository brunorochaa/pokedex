import 'bloc.dart';
import 'package:projeto_final/data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepository = PokemonRepository();

  PokemonBloc() : super(PokemonInitial());

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is PokemonPageRequest) {
      yield PokemonLoadInProgress();

      try {
        final pokemonPageResponse = await _pokemonRepository.getPokemonPage(event.page);
        yield PokemonPageLoadSuccess(
            pokemonListings: pokemonPageResponse.pokemonListings,
            canLoadNextPage: pokemonPageResponse.canLoadNextPage);
      } catch (e) {
        yield PokemonPageLoadFailed(error: Error());
      }
    }
  }
}