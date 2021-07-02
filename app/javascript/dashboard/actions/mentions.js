export const setMentions = (username) => {
    return {
      type: "SET_MENTIONS",
      async payload () {
        const url = `/api/v1/attractions/user/mentioned/${username}`;
        const response = await fetch(url);
        const json = await response.json();
        return json["mentioned_posts"];
      }
  };
};