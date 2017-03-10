import React from 'react';
import { Link } from 'react-router';

export const PokemonIndexItem = (props) => (
  <Link to={`/pokemon/${props.id}`}>
    <li className="pokename">
      <img className="pokeimage" src={props.imageUrl} />
      {props.name}
    </li>
  </Link>
  );
