import React, { PropTypes } from 'react';

const Todo = ({ onClick, completed, text }) => (
  <li
  onClick={onClick}
  style={{
    textDecoratino: completed ? 'line-through' : 'none'
  }}
  >
    {text}
  </li>
);

Todo.propTypes = {
  onClick: PropTypes.func.isRequired,
  completed: PropTypes.bool.isRequried,
  text: PropTypes.string.isRequired
};

export default Todo;
