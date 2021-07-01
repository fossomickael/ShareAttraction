export const setAttractions = (user_id) => {
    return {
      type: "SET_ATTRACTIONS",
      async payload () {
        const url = `/api/v1/attractions/user/${user_id}`;
        const response = await fetch(url);
        const json = await response.json();
        return json["attractions"];
      }
    };
  };