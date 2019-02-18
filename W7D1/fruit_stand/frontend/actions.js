export const ADD_FRUIT = "ADD_FRUIT";
export const CLEAR = "CLEAR";

export const addOrange = () => ({
  type: ADD_FRUIT,
  fruit: "Orange"
})

export const addApple = () => ({
  type: ADD_FRUIT,
  fruit: 'Apple'
});

export const addPears = () => ({
  type: ADD_FRUIT,
  fruit: 'Pears'
});

export const clearFruit = () => ({
  type: CLEAR
});
