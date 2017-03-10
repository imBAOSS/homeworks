export const fetchAllPokemon = () =>{
  return (
    $.ajax({
      url: '/api/pokemon'
    })
  );
};

export const fetchPokemon = (id) =>{
  return (
    $.ajax({
      url: `/api/pokemon/${id}`
    })
  );
};
