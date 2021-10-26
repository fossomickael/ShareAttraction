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
            backgroundColor: [
              'rgb(34, 40, 49)',
              'rgb(0, 173, 181)',  
              'rgb(238, 238, 238)',
              'rgb(57, 62, 70)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(255, 205, 86, 0.2)',
              
              'rgba(54, 162, 235, 0.2)',
              'rgba(201, 203, 207, 0.2)'
            ],
            borderWidth: 1,
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