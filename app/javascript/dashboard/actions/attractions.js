export const setAttractions = () => {
    return {
      type: "SET_ATTRACTIONS",
      async payload () {
        return [{
            id : 1,
            title : "Super Programmers!",
            content: "Charm at the Steps of the Sacre Coeur/Montmartre",
            author: "Mike Faz",
          }];
      }
    };
  };