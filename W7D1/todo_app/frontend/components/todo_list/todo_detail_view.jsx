import React from 'react';

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
    this.state = {show: true};
    this.showDetail = this.showDetail.bind(this);
  }

  showDetail() {
    this.show = !this.show;
    this.setState({show: this.show});
  }

  render() {
    let body = "";
    if(this.show) {
      body = <li>{this.props.todo.body}</li>;
    }
    return (
      <div>
        {body}
        <button onClick={this.showDetail}>{this.show ? "Hide" : "Show"}</button>
      </div>
    );
  }
}

export default TodoDetailView;
