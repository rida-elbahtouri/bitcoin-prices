import Chart from "chart.js" 
const buttonsc = document.querySelectorAll(".btn-time")
const chartcanva = document.getElementById('chart');
const bitcoinvalue = document.getElementById("bitcoin-value")


fetch("/chart/year")
    .then((data) => data.json())
    .then((data) => {
        let keys = [];
        let values = []
        for(let k in data){
            keys.push(k);
            values.push(parseInt(data[k],10))
        } 
    drawChart(keys,values)
});

    fetch("/getvalue")
    .then((data) => data.json())
    .then((data) => {
        bitcoinvalue.innerHTML = data
    }).catch(()=> { 
        bitcoinvalue.innerHTML = "loading..."
    });

    setInterval(function() {

        let oldvalue = 0
        fetch("/getvalue")
        .then((data) => data.json())
        .then((data) => {
           oldvalue = data
            bitcoinvalue.innerHTML = data
        }).catch(()=> {
            bitcoinvalue.innerHTML = oldvalue
        });
    }, 60 * 1000);
        


const drawChart = (lab,val) =>{
    var myChart = new Chart(chartcanva, {
        type: 'line',
        data: {
            labels: lab,
            datasets: [{
                label: 'value of Bitcoin',
                data: val,
                backgroundColor: ['rgba(255, 99, 132, 0.2)',],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: false
                    }
                }]
            }
        }
    });

    return myChart
}



buttonsc.forEach(btn=>{
    btn.addEventListener('click',(e)=>{
        fetch(`/chart/${btn.value}`)
        .then((data) => data.json())
        .then((data) => {
            let keys = [];
            let values = []
            for(let k in data){
                keys.push(k);
                values.push(parseInt(data[k],10))
            } 
            drawChart(keys,values)
        });
})
})
