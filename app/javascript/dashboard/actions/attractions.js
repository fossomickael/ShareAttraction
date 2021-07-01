export const setAttractions = () => {
    return {
      type: "SET_ATTRACTIONS",
      async payload () {
        return ["hello","Bonjour"];
      }
    };
  };