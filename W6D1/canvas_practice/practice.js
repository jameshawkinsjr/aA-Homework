document.addEventListener("DOMContentLoaded", function(){
    var canvas = document.getElementById('mycanvas'); 
    var ctx = mycanvas.getContext('2d');
    ctx.fillStyle = "red"; 
    ctx.fillRect(0,0,500,500);
    
});

document.addEventListener("DOMContentLoaded", function(){
    var star = document.getElementById('star'); 
    var ctx_star = star.getContext('2d');
    ctx_star.beginPath();
    ctx_star.moveTo(33, 33);
    ctx_star.lineTo(50, 0);
    ctx_star.lineTo(66, 33);
    ctx_star.lineTo(100, 40);
    ctx_star.lineTo(75, 60);
    ctx_star.lineTo(80, 100);
    ctx_star.lineTo(50, 80);
    ctx_star.lineTo(20, 100);
    ctx_star.lineTo(25, 60);
    ctx_star.lineTo(0, 40);
    ctx_star.lineTo(33, 33);
    ctx_star.strokeStyle = 'red';
    ctx_star.stroke();
    ctx_star.fillStyle = 'yellow';
    ctx_star.fill();

    
});

document.addEventListener("DOMContentLoaded", function(){

    var canvas2 = document.getElementById('canvas2'); 
    var ctx2 = canvas2.getContext('2d');
    ctx2.beginPath();
    ctx2.arc(100,75,50,0, 2 * Math.PI);
    ctx2.lineWidth = 10;
    ctx2.strokeStyle = 'red';
    ctx2.stroke();
    ctx2.fillStyle = 'blue';
    ctx2.fill();
    
});