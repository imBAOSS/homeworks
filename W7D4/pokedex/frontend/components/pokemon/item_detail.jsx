import React from 'react';

const ItemDetail = (props) => {
  let itemProps ;
   if (props.item){
    itemProps =<ul>
                  <li>{props.item.name}  </li>
                  <li>  {props.item.happiness} </li>
                  <li>  {props.item.price}</li>
                </ul>;
   }
  return (
    <div>
      {itemProps}
    </div>
  );
};

export default ItemDetail;
