import {connect} from 'react-redux';
import TodoList from './todo_list';
import allTodos from '../../reducers/selectors';
import { fetchTodos, createTodo, deleteTodo, updateTodo } from '../../actions/todo_actions';

const mapStateToProps = state => ({
  todos: allTodos(state),
  errors: state.errors
});

const mapDispatchToProps = dispatch => ({
  deleteTodo: todo => dispatch(deleteTodo(todo)),
  fetchTodos: () => dispatch(fetchTodos()),
  createTodo: todo => dispatch(createTodo(todo)),
  updateTodo: todo => dispatch(updateTodo(todo)),

});

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
