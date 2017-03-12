import * as APIUtil from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER";
export const RECEIVE_ERRORS = "RECEIVE_ERRORS";

export const receiveCurrenUser = (currentUser) => ({
  type: RECEIVE_CURRENT_USER,
  currentUser
});

export const receiveErrors = (errors) => ({
  type: RECEIVE_ERRORS,
  errors
});

export const signup = user => dispatch => (
  APIUtil.signup(user)
    .then(
      signedUpUser => dispatch(receiveCurrenUser(signedUpUser)),
      err => dispatch(receiveErrors(err.responseJSON)
    )
  )
);

export const login = user => dispatch => (
  APIUtil.login(user)
    .then(
      loggedInUser => dispatch(receiveCurrenUser(loggedInUser)),
      err => dispatch(receiveErrors(err.responseJSON)
    )
  )
);

export const logout = () => dispatch => (
  APIUtil.logout()
    .then(
      () => dispatch(receiveCurrenUser(null)),
      err => dispatch(receiveErrors(err.responseJSON)
    )
  )
);
