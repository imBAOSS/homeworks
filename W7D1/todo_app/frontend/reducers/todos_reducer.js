import {RECEIVE_TODOS, RECEIVE_TODO, REMOVE_TODO} from '../actions/todo_actions';
import merge from 'lodash/merge';


const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

const newTodos = {1: {
  id: 1,
  title: " dog",
  body: " shampoo",
  done: true
}};

const todosReducer = (state = initialState, action) => {
  switch(action.type){
    case RECEIVE_TODOS:
      const newState = Object.assign({}, action.todos);
      return newState;
    case RECEIVE_TODO:
      const newTodo = merge({}, state, {[action.todo.id]: action.todo});
      return newTodo;
    case REMOVE_TODO:
      const copyState = merge({}, state);
      delete copyState[action.todo.id];
      return copyState;
    default:
      return state;
  }
};

export default todosReducer;
