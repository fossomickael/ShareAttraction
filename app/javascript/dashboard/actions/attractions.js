export const setAttractions = (username) => {
    return {
      type: "SET_ATTRACTIONS",
      async payload () {
        const url = `/api/v1/attractions/user/${username}`;
        const response = await fetch(url);
        const json = await response.json();
        return json["attractions"];
      }
    };
  };