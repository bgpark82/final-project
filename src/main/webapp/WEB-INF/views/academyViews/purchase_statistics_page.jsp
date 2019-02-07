<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="#" />


<meta charset="UTF-8">
<title>Insert title here</title>

<style>


svg{
   width : 600px; height : 500px;
   border : 1px solid black;
}
.bar {
   fill: orange;
}
.bar:hover{
   fill: orangered;
}

.barNum{
   font-size: 7pt;
   text-anchor : middle;
}
.axis text{
   font-family: sans-serif;
   font-size: 7px;
}

.axis path,
.axis line{
   fill : none;
   stroke: black;
   shape-rendering: crispEdges;
}

.barName{
   font-size: 8px;
   text-anchor: middle;
}


/* Creates a small triangle extender for the tooltip */
.d3-tip:after {
  box-sizing: border-box;
  display: inline;
  font-size: 7px;
  width: 100%;
  line-height: 1;
  color: rgba(0, 0, 0, 0.8);
  content: "\25BC";
  position: absolute;
  text-align: center;
}

/* Style northward tooltips differently */
.d3-tip.n:after {
  margin: -1px 0 0 0;
  top: 100%;
  left: 0;
}

</style>


</head>
<body>

<form action="../academy/purchase_statistics" method="get">
   <select name="year">
      <c:set var="today" value="<%=new java.util.Date()%>" />
         <fmt:formatDate value="${today}" pattern="yyyy" var="start"/>
<!--            <option value="">--년도--</option> -->

        <c:forEach begin="0" end="10" var="idx" step="1">

            <option value="${start - idx}" <c:if test="${year == start - idx}"> selected='selected'</c:if>>

         <c:out value="${start - idx}" />
         
         </option>

        </c:forEach>
   </select>

   <select name="client_no">
<!--       <option>--선택--</option> -->
      <c:forEach var="client_Dto" items="${client_list }">
         <option value="${client_Dto.client_no }" <c:if test="${client_no == client_Dto.client_no}"> selected='selected'</c:if>>${client_Dto.client_name}</option>
      </c:forEach>
   </select>
   <input type="submit" value="조회">
</form>      


<svg id="myGraph">
</svg>

<script src="https://d3js.org/d3.v3.js"></script>
<script type="text/javascript">

var svgHeight = 500;
var barElements;
var dataSet = ${list};
 console.log(${list});

if(dataSet != null){

var offsetX = 50;
var offsetY = 60;

var y_range_limit = 400;

var interval = 5;

//그래프에 눈금 표시
var y = d3.scale.linear()
         .range([y_range_limit, 0]) //실제 표시할 때의 범위
         .domain([0,1000]) //축이 나타 낼 데이터의 범위
         
var yScale = d3.svg.axis()
            .scale(y) //스케일 적용
            .orient("left") //눈금의 표시 위치를 왼쪽으로 지정
            .tickValues(d3.range(0, 1001, 50)) //축의 눈금 표시(0에서 301까지 50간격으로)
            .tickFormat(function(d){ return d+"장"})   //단위

d3.select("#myGraph").append("g")   //눈금은 g요소를 사용하여 그룹화(g라는 요소가 myGraph안의 모든 요소들을 선택할 수 있도록 해줌)
      .attr("class", "axis")
      .attr("transform", "translate(40, "+(svgHeight-y_range_limit-60)+")") //눈금 표시 위치 설정
      .call(yScale) 
      
      
      
barElements = d3.select("#myGraph")
             .selectAll("rect")
             .data(dataSet);
             
barElements.enter() //데이터가 추가될 때 데이터 개수 만큼 반복
          .append("rect")
          .attr("class", "bar")
          .attr("height", function(d){
             console.log(d);
             return d*0.4;
          })
          .attr("width", "20")
          .attr("x", function(d,i){
             console.log(i);
             return i * 33 + offsetX;
          })
          .attr("y", function(d){
             return svgHeight - d*0.4 - 60;
          })
    
textElements = d3.select("#myGraph")
            .selectAll("#barNum")
            .data(dataSet)
            
 textElements.enter()
    .append("text")
    .attr("class","barNum")
    .attr("x", function(d, i){
       return i * 33 + 10 + offsetX;
    })
    .attr("y", function(d, i){
       return svgHeight - d*0.4 -70;
    })
    .text(function(d){
       return d;
    })
    

d3.select("#myGraph").append("rect")
      .attr("class", "axis")
      .attr("width", 500)
      .attr("height", 1)
      .attr("transform", "translate(40, "+((svgHeight-offsetY))+")")
    
var xElements = d3.select("#myGraph")
         .selectAll("#barName")
         .data(dataSet)
xElements.enter()
      .append("text")
      .attr("class","barName")
      .attr("x", function(d, i){
         return i * 33  + offsetX + 10 ;
      })
      .attr("y", svgHeight + 15 - offsetY)
      .text(function(d,i){
         return i+1+"월";
         //return ["A","B","C","D","E","F","G"][i]
      })
      
}else{
   
};
     

      
</script>



</body>
</html>