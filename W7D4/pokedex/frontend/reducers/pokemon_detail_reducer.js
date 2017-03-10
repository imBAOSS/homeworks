import { RECEIVE_POKEMON } from '../actions/pokemon_actions';
import merge from 'lodash/merge';

const pokemonDetailReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_POKEMON:
      return merge({}, state, action.pokemonDetail);
    default:
      return state;
  }
};

export default pokemonDetailReducer;
