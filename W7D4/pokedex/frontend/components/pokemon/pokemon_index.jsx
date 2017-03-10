import React from 'react';
import { PokemonIndexItem } from './pokemon_index_item';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    this.pokemon = this.props.pokemon;
    const pokemonList = this.pokemon.map((poke,idx) =>
      <div className= "pokeitem" key={idx}>
        <PokemonIndexItem name={poke.name}
                          imageUrl={poke.image_url}
                          id={poke.id}/>
      </div>
    );

    return (
      <div className="page">
        <ul className= "pokelist">
          { pokemonList }
        </ul>
        <section className="showPokemon">
          {this.props.children}
        </section>
      </div>
    );
  }
}

export default PokemonIndex;
