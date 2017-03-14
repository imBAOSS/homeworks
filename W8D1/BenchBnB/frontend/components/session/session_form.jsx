import React from 'react';
import { Link, withRouter } from 'react-router';

class SessionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: "",
      password: ""
    };
    this.formType = props.formType;
    this.update = this.update.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  componentWillMount() {
    if (this.props.loggedIn) {
      this.props.router.push("/");
    }
  }

  handleSubmit(e) {
    e.preventDefault();
    this.props.processForm(this.state);
  }

  update(field) {
    return e => this.setState({[field]: e.target.value});
  }

  render() {
    const header = this.props.formType === 'signup' ? 'Sign Up' : "Log In";
    const path  = this.props.formType === "signup" ? "/login" : "/signup";
    const link = this.props.formType === "signup" ? "Log In" : "Sign Up";

    return (
      <div>
        <h2>{header}</h2>
        <form onSubmit={this.handleSubmit}>
          <br/>
          <label>Username
            <input
              type="text"
              onChange={this.update('username')}
              value={this.state.username}/>
          </label>
          <br/>
          {this.props.errors}
          <br/>
          <label>Password
            <input
              type="password"
              onChange={this.update('password')}
              value={this.state.password}/>
          </label>
          <br/>
          <input type='submit'/>
        </form>
        <br/>
        <Link to={path}>
          {link}
        </Link>
      </div>
    );
  }
}

export default SessionForm;
