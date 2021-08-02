import { Chart, registerables } from 'chart.js';


const initPostChart = () => {
    const ctx = document.getElementById('PostChart');
    if (!ctx)
    return
    const postid = ctx.dataset.postid;
    fetchStats(postid).then(content => console.log(content)) 


}

const  fetchStats = async (postid) => {
    try {
      const url = `/api/v1/posts/${postid}/referrers`
      const response = await fetch(url);
      const stats = await response.json();
      return stats;
    }
    catch (error) {
      console.log(error)
    }
     
}

export {initPostChart}