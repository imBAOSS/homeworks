export const fetchTodos = () => (
  $.ajax({
    type: 'GET',
    url: 'api/todos'
  })
);

export const createTodo = (todo) => (
  $.ajax({
    type: 'POST',
    url: 'api/todos',
    data: {todo: todo}
  })
);

export const updateTodo = (todo) => (
  $.ajax({
    type: 'PATCH',
    url: `/api/todos/${todo.id}`,
    data: {todo: todo}
  })
);

export const deleteTodo = (todo) => (
  $.ajax({
    type: 'DELETE',
    url: `/api/todos/${todo.id}`
  })
);
