<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
  <style>
    text:hover {
        stroke: black;
    }
  </style>
  <script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/d3-cloud/1.2.4/d3.layout.cloud.js"></script>
</head>
<title>Insert title here</title>
</head>
<body>
  <div id="cloud"></div>
  <script type="text/javascript" charset="utf-8">
    var weight = 200,   // change me
        width = 960,
        height = 500;
    var fill = d3.scale.category20();
    d3.csv("css/word.csv;charset=utf-8", function(d) {
       //console.log(d);
        return {
          text: d.word,
          size: weight/((+d.freq) + 1)
        }
      },
      function(data) {
        d3.layout.cloud().size([width, height]).words(data)
          //.rotate(function() { return ~~(Math.random() * 2) * 90; })
          .rotate(0)
          .font("Impact")
          .fontSize(function(d) { return d.size; })
          .on("end", draw)
          .start();
        function draw(words) {
          d3.select("#cloud").append("svg")
              .attr("width", width)
              .attr("height", height)
            .append("g")
              .attr("transform", "translate(" + width/2 + "," + height/2 + ")")
            .selectAll("text")
              .data(words)
            .enter().append("text")
              .style("font-size", function(d) { return d.size + "px"; })
              .style("font-family", "Impact")
              .style("fill", function(d, i) { return fill(i); })
              .attr("text-anchor", "middle")
              .attr("transform", function(d) {
                return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
              })
            .text(function(d) { return d.text; });
        }
      });
  </script>
</body>
</html>