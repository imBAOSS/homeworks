import React from 'react';

class Tabs extends React.Component {
  constructor(props) {
    super(props);
    this.state = {selectedTab: 0};
    this.selectTab = this.selectTab.bind(this);
  }

  selectTab(e) {
    let selectedTab = parseInt(e.target.id);
    this.setState({ selectedTab });
  }

  render() {
    const tabs = [];
    const content = [];

    this.props.tabdata.map((tab, idx) => {
      tabs.push(
        <li onClick={this.selectTab} key={idx} id={idx}><h2 key={idx} id={idx}>{tab.title}</h2></li>);
      content.push(tab.content);
    });

    return (
      <div>
        <h1>Tabs</h1>
        <section>
          <ul>
            {tabs}
          </ul>
          <article>
            {content[this.state.selectedTab]}
          </article>
        </section>
      </div>
    );
  }
}

export default Tabs;
