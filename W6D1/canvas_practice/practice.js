document.addEventListener("DOMContentLoaded", function(){

  const myCanvasEl = document.getElementById("mycanvas");
  myCanvasEl.height= 500;
  myCanvasEl.width= 500;

  const ctx = myCanvasEl.getContext("2d");
  ctx.fillStyle = "green";
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  ctx.arc(250, 250, 20, 0, 2*Math.PI, true);
  ctx.strokeStyle = 'black';
  ctx.lineWidth = 10;
  ctx.stroke();

  ctx.fillStyle = 'red';
  ctx.fill();

});
