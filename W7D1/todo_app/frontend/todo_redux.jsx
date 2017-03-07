import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import configureStore from './store/store';
import allTodos from './reducers/selectors';
import App from './components/app';
import Root from './components/root';

const Todo = () => <h1>Todos App</h1>;

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  const root = document.getElementById("root");
  ReactDOM.render(<Root store={ store } />, root);

  window.allTodos = allTodos;
  window.store = store;
});
