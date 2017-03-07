export const ADD_STEPS = 'ADD_STEPS';
export const ADD_STEP = 'ADD_STEP';
export const REMOVE_STEP = 'REMOVE_STEP';


export const receiveSteps = (steps) => ({
  type: ADD_STEPS,
  steps
});

export const receiveStep = (step) => ({
  type: ADD_STEP,
  step
});

export const removeStep = (step) => ({
  type: REMOVE_STEP,
  step
});
