import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import { fetchAllPokemon } from './util/api_util';
import { RECEIVE_ALL_POKEMON, receiveAllPokemon } from './actions/pokemon_actions';
// document.addEventListener('domContentLoaded', ()=> {
//   const root = document.getElementById('root');
//   ReactDOM.render(<Root /> , root);
// });

window.receiveAllPokemon = receiveAllPokemon;
window.fetchAllPokemon = fetchAllPokemon;
document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();

  window.store = store;
  ReactDOM.render(<h1>Pokedex</h1>, root);
});
