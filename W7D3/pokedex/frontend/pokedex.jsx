import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';

import { fetchAllPokemon } from './util/api_util';
import { RECEIVE_ALL_POKEMON,
        receiveAllPokemon,
        requestAllPokemon } from './actions/pokemon_actions';

import  selectAllPokemon  from './reducers/selectors';

window.selectAllPokemon = selectAllPokemon;
window.receiveAllPokemon = receiveAllPokemon;
window.fetchAllPokemon = fetchAllPokemon;
window.requestAllPokemon = requestAllPokemon;
document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  const store = configureStore();

  window.store = store;
  ReactDOM.render(<Root store={store} />, root);
});
