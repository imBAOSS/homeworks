import { createStore } from 'redux';
// import {receiveTodo, receiveTodos} from '../actions/todo_actions';

import rootReducer from '../reducers/root_reducer';

const configureStore = () => createStore(rootReducer);

export default configureStore;
