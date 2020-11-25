
const buttons = document.getElementsByClassName("btn-time")


buttons.forEach(btn=>{
    btn.addEventListener('click',(e)=>{
        fetch(`/chart/${btn.value}`)
        .then((data) => data.json())
        .then((data) => {
            //display function
        });
})
})
