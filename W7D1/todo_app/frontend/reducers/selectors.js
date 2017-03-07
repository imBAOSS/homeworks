const allTodos = (state) => (
  Object.keys(state.todos).map(id => state.todos[id])
);

const stepsByTodoId = (state, todoId) => (
  Object.keys(state.steps).filter(el => el.todo_id === todoId)
);

export default allTodos;
