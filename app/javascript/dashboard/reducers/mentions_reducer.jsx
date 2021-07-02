const mentionsReducer = (state, action) => {
    if (state === undefined) {
      return [];
    }
    switch (action.type) {
      case "SET_MENTIONS_FULFILLED":
          return action.payload;
        default:
          return state;
    }
  };
  
export default mentionsReducer;