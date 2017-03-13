import React from 'react';
import { Provider } from 'react-redux';
import { Router, Route, IndexRoute, hashHistory } from 'react-router';

const Root = ({store}) => (
  <Provider store={store}>
    <Router history={ hashHistory }>
      <Route path='/' component={ App } />
    </Router>
  </Provider>
);
