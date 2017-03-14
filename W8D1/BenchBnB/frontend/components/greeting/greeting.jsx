import React from 'react';
import { Link, hashHistory } from 'react-router';

class Greeting extends React.Component {
  constructor(props) {
    super(props);
    this.state = {currentUser: this.props.currentUser};
  }

  componentWillReceiveProps(newProps) {
    this.setState({currentUser: newProps.currentUser});
  }

  render() {
    let greeting;
    if (this.state.currentUser) {
      greeting = (
        <div>
          <h2>{`Welcome ${this.state.currentUser.username}!`}</h2>
          <br/>
          <button onClick={this.props.logout}>Log Out</button>
        </div>
      );
    } else {
      greeting = (
        <div>
          <Link to={`/signup`}>Sign Up</Link>
          <br/>
          <Link to={`/login`}>Log In</Link>
        </div>)
      ;
    }

    return (
      <div>
        {greeting}
      </div>
    );
  }
}

export default Greeting;
