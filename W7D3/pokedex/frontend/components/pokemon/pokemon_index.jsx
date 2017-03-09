import React from 'react';

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
    <div key= {idx} >
      <li>{poke.name}</li>
      <img src={poke.image_url} width= {"100px"} height = {"100px"}/>
      </div>
    );
    return (
      <div>
        <ul>
          { pokemonList }
        </ul>
      </div>
    );
  }
}

export default PokemonIndex;
