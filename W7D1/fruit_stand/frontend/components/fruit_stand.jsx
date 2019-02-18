import React from 'react';

const FruitStand = ({fruits, addApple, addOrange, addPears, clearFruit}) => (
  <div>
    <button onClick={addApple}>Apple</button>
    <button onClick={addOrange}>Orange</button>
    <button onClick={addPears}>Pears</button>
    <button onClick={clearFruit}>Clear</button>
    
    <ul>
      {fruits.map((fruit, idx) => <li key={idx}>{fruit}</li>)}
    </ul>

  </div>
)

export default FruitStand;
