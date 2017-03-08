import React from 'react';
import TodoListContainer from './todo_list/todo_list_container';

class App extends React.Component {
  constructor() {
    super();
  }

  render() {
    return (
      <div className = "App">
        <h1>The REAL Todo App</h1>
        <TodoListContainer />
      </div>
      );
  }
}

export default App;
