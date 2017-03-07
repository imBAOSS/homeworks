import React from 'react';
import { Provider } from 'react-redux';
import App from './app';

const Root = (props) => {
  let store = props.store;
  return (
    <Provider store={ store }>
      <App />
    </Provider>
  );
};

export default Root;
