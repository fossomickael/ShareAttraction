const attractionsReducer = (state, action) => {
    if (state === undefined) {
      return [];
    }
    switch (action.type) {
      case "SET_ATTRACTIONS_FULFILLED":
        return action.payload;
        default:
          return state;
    }
  };
  
  export default attractionsReducer;