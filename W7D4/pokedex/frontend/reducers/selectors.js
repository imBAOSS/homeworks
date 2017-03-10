export const selectAllPokemon = (state) => (
  Object.keys(state.pokemon).map(id => state.pokemon[id])
);

export const selectPokemonItem = (state, itemId) => {
  if (!!state.pokemonDetail.items) {
    return state.pokemonDetail.items.find(el => (
      el.id == itemId
    ));
  }
};
