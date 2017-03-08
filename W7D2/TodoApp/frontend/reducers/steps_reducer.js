const initialState = {
  todos: {
    1: {
      id: 1,
      title: "take a shower",
      body: "and be clean",
      done: false
    }
  },
  steps: {
    1: { // this is the step with id = 1
      id: 1,
      title: "walk to store",
      done: false,
      todo_id: 1
    },
    2: { // this is the step with id = 2
      id: 2,
      title: "buy soap",
      done: false,
      todo_id: 1
    }
  }
};

const stepsReducer = (state = initialState, action) => {
  switch (action.type) {
    default:
      return state;
  }
};

export default stepsReducer;
