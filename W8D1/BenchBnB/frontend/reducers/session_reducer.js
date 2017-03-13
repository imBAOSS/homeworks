import { RECEIVE_CURRENT_USER, RECEIVE_ERRORS } from '../actions/session_actions.js';
import merge from 'lodash/merge';

const _nullUser = {
  currentUser: null,
  errors: []
};

const SessionReducer = (oldState = _nullUser, action) => {
  Object.freeze(oldState);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      let newState = merge({}, oldState);
      newState.session.currentUser = action.currentUser;
      newState.session.errors = [];
      return newState;
    case RECEIVE_ERRORS:
      newState.session.currentUser = null;
      newState.session.errors = action.user.errors;
      return newState;
    default:
      return oldState;
  }
};

export default SessionReducer;
