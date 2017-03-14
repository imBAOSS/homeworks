import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { login, logout, signup } from './actions/session_actions';


document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');

  let store;
  if (window.currentUser) {
    const preLoadedState = { session: { currentUser: window.currentUser } };
    store = configureStore(preLoadedState);
  } else {
    store = configureStore();
  }

  window.store = store;
  window.login = login;
  window.logout = logout;
  window.signup = signup;

  ReactDOM.render(<Root store={store}/>, root);
});
