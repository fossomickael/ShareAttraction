import { Chart, registerables } from 'chart.js';


const initPostChart = () => {
    const ctx = document.getElementById('PostChart');
    if (!ctx)
    return
    const postid = ctx.dataset.postid;
    let dataposts = [];
    let labels = [];
    fetchStats(postid).then(referrers => { 
        const label = `Best referrers for ${referrers["title"]}`;
        const sharers = referrers["sharers"]
        Object.keys(sharers).forEach(key => {
          labels.push(sharers[key]["username"]);
          dataposts.push(sharers[key]["count"]);
    });
    
    const data = {
        labels: labels,
        datasets: [{
            label: label, 
            data: dataposts,
        }] 
    }


    const config = {
        type: 'bar',
        data: data,
        options: {
            scales: {
            y: {
                beginAtZero: true
            }
            }
        },
    };   
    

    Chart.register(...registerables);
      const myChart = new Chart(
        ctx,
        config
      );

    })

      



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