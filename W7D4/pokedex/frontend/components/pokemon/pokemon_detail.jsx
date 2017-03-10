import React from 'react';

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestPokemon(this.props.params.id);
  }

  componentWillReceiveProps(newProps) {
    if(this.props.pokemonDetail.id != newProps.params.id) {
      this.props.requestPokemon(newProps.params.id);
    }
  }

  render() {
    let moves;
    let items;
    if( this.props.pokemonDetail.moves){
      moves = this.props.pokemonDetail.moves.join(", ");
      items = this.props.pokemonDetail.items.map( (item, idx) => (
          <li key={idx}>
            {item.name}
          </li>
        )
      );
    }

    return (
      <div>
        <section className="pokemonStats">
          <img src={this.props.pokemonDetail.image_url}/>
          {this.props.pokemonDetail.name} <br />
          {this.props.pokemonDetail.poke_type} <br />
          {this.props.pokemonDetail.attack} <br />
          {this.props.pokemonDetail.defense} <br />
          Moves: {moves}
        </section>

        <ul>
          {items}
          {this.props.children}
        </ul>
      </div>
      );
  }
}

export default PokemonDetail;
