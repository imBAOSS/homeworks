import React from 'react';

import GiphysIndex from './giphys_index';

class GiphySearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {search: ""};
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(e) {

  }

  handleSubmit(e) {
    e.preventDefault();
  }

  render() {
    return (
      <div className='Search-Form'>
        <label>
          <input onChange={this.handleChange}></input>
        </label>

        <input type="submit" onClick={this.handleSubmit}></input>

      <GiphysIndex />
      </div>
    );
  }
}

export default GiphySearch;
