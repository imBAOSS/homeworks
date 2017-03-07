import React from 'react';
import TodoForm from './todo_form';
import TodoDetailView from './todo_detail_view';

class TodoList extends React.Component {
  constructor() {
    super();

    this.state = {detail: false};
    this.deleteTodo = this.deleteTodo.bind(this);
    this.updateTodo = this.updateTodo.bind(this);
  }

  deleteTodo(e, el) {
    this.props.removeTodo(el);
  }

  updateTodo(e, el) {
    el.detail = !el.detail;
    this.setState({detail: el.detail});
  }

  render() {
    let listItems = this.props.todos.map((el, idx) => (
      <div key={idx}>
        <li key={el.id}>{el.title}</li>
        <ul>
          <TodoDetailView todo={el}/>
        </ul>
        <button key={'button-' + el.id} onClick={(e) => {this.deleteTodo(e, el);}}>Delete</button>
        <button key={'status-' + el.id} onClick={(e) => {this.updateTodo(e, el);}}>
          {el.done ? `Undo` : `Done`}
        </button>
      </div>
    ));

    return(
      <div className="TodoList">
        <ul>
          {listItems}
        </ul>
        <TodoForm receiveTodo={this.props.receiveTodo} />
      </div>

    );
  }
}
export default TodoList;
