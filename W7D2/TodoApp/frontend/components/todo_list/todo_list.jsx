import React from 'react';
import TodoForm from './todo_form';
import TodoDetailView from './todo_detail_view';


class TodoList extends React.Component {
  componentDidMount(){
    this.props.fetchTodos();
  }
  constructor() {
    super();

    this.state = {done: false};
    this.delTodo = this.delTodo.bind(this);
    this.updateTodo = this.updateTodo.bind(this);
  }

  delTodo(e, el) {
    this.props.deleteTodo(el);
  }

  updateTodo(e, el) {

    el.done = !el.done;
    this.props.updateTodo(el);
    // this.setState({detail: el.detail});
  }

  render() {
    let listItems = this.props.todos.map((el, idx) => (
      <div key={idx}>
        <li key={el.id}>{el.title}</li>
        <ul>
          <TodoDetailView todo={el}/>
        </ul>
        <button key={'button-' + el.id} onClick={(e) => {this.delTodo(e, el);}}>Delete</button>
        <button key={'status-' + el.id} onClick={(e) => {this.updateTodo(e, el);}}>
          {el.done ? `Undo` : `Done`}
        </button>
      </div>
    ));

    let listErrors = this.props.errors.map((er,idx)=>(
        <li key={idx}>{er}</li>
    ));

    return(
      <div className="TodoList">
        <ul className="Errors">
          {listErrors}
        </ul>
        <ul>
          {listItems}
        </ul>
        <TodoForm createTodo={this.props.createTodo} />
      </div>

    );
  }
}
export default TodoList;
