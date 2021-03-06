import React from 'react';

class TodoForm extends React.Component{
  constructor(props){
    super(props);

    this.state = {title: "", body: ""};
    this.uniqueId = this.uniqueId.bind(this);
    this.makeTodo = this.makeTodo.bind(this);
    this.updateTitle = this.updateTitle.bind(this);
    this.updateBody = this.updateBody.bind(this);
  }
  uniqueId() {
    return new Date().getTime();
  }
  makeTodo(event){
    event.preventDefault();
    let id = this.uniqueId();
    let todo = {
        title: this.state.title,
        body: this.state.body,
        done: false
    };
    this.props.createTodo(todo).then(() =>
    this.setState({title: "", body: ""}));
  }

  updateTitle(event) {
    this.setState({title: event.target.value});
  }

  updateBody(event) {
    this.setState({body: event.target.value});
  }

  updateTag(event) {
    debugger;
    this.setState({tag_names: [event.target.value]});
  }

  render(){
    return(
      <div className="todoForm">
        <label>Title
          <input type="text" onChange={this.updateTitle} value={this.state.title}></input>
        </label>
        <label>Body
          <input type="text" onChange={this.updateBody} value={this.state.body}></input>
        </label>
        <label>Tags
          <input type="text" onChange={this.updateTag}></input>
        </label>
        <input type="submit" onClick={this.makeTodo}></input>
      </div>
    );
  }
}
export default TodoForm;
