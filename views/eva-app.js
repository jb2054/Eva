
function init() {
    const mode = document.querySelector('.content').getAttribute('data-mode');
    console.log('mode: ' + mode);   
    if (mode==='false') {
        const app = document.getElementById('eva-app');
        console.log(app);       
        const div = document.createElement('div');
        console.log(div);
        div.setAttribute("class", "d-flex flex-row flex-grow-1");              
            const div2 = document.createElement('div');
            div2.setAttribute("class","col-2 sidebar");
            div2.setAttribute("style","overflow-y: scroll");
            div.appendChild(div2); 
            const div4 = document.createElement('div');
            div4.setAttribute("id","column-left");
            div4.setAttribute("style", "height:calc(100vh - 99.5px);");        
            div.appendChild(div4); 
            const div3 = document.createElement('div');
            div3.setAttribute("class","col");
            div.appendChild(div3); 
            div3.insertAdjacentHTML = '{% include "./template/common/dashboard.twig" %}';
        app.appendChild(div);
    }
}

document.addEventListener('DOMContentLoaded', init());