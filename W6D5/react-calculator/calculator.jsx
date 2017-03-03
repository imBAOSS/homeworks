import React from 'react';

class Calculator extends React.Component {
  constructor() {
    super();
    this.state = { result: 0, num1: "", num2: "" };

    this.setnum1 = this.setnum1.bind(this);
    this.setnum2 = this.setnum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
    // your code here
  }

  // your code here
  setnum1(e) {
    const num1 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({ num1 });
  }

  setnum2(e) {
    const num2 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({ num2 });
  }

  add(e) {
    e.preventDefault();
    const result = this.state.num1 + this.state.num2;
    this.setState({ result });
  }

  subtract(e) {
    e.preventDefault();
    const result = this.state.num1 - this.state.num2;
    this.setState({ result });
  }

  multiply(e) {
    e.preventDefault();
    const result = this.state.num1 * this.state.num2;
    this.setState({ result });
  }

  divide(e) {
    e.preventDefault();
    const result = this.state.num1 / this.state.num2;
    this.setState({ result });
  }

  clear(e) {
    e.preventDefault();
    this.setState({ result: 0, num1: "", num2: "" });
  }

  render() {
    const {num1, num2, result} = this.state;
    return (
      <div>
        <h1>{result}</h1>
        <input onChange={this.setnum1}type="text" value={num1} />
        <input onChange={this.setnum2}type="text" value={num2} />
        <button onClick={this.clear}>Clear</button>
        <br />
        <button onClick={this.add}>+</button>
        <button onClick={this.subtract}>-</button>
        <button onClick={this.multiply}>*</button>
        <button onClick={this.divide}>/</button>
      </div>
    );
  }
}

export default Calculator;
