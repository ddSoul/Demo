
// var script=document.createElement("script");  
// script.type="text/javascript";  
// script.src="jquery.js";  
// document.getElementsByTagName('head')[0].appendChild(script);  

$(document).ready(function(){
$("#btntest").click(function(){
$("p").hide();
});
});


$(document).ready(function(){
$(".clickex").click(function(){
    $(".showtitle").slideToggle("slow");
  });
});


// $(document).ready(function(){
//   $("button").click(function(){
//    $("#img-2").fadeOut();
//     $("#img-3").fadeOut("slow");
//     $("#img-4").fadeOut(3000);
//   });
// });

function makeRequest() {
    alert("inside makeRequest()");
    var settings = {
        type: "GET",
        // data: {page:1},
        url:"http://apis.baidu.com/showapi_open_bus/showapi_joke/joke_text",
        dataType:"json",
        error: function(XHR,textStatus,errorThrown) {
            alert(errorThrown);
        },
        success: function(data,textStatus) {

            // var list 
            // alert(data.showapi_res_body.contentlist[0].title);

            var list = data.showapi_res_body.contentlist;
            for (x in list)
             {
                document.write(list[x].text + "<br />")
              }
            // document.getElementById("ft").innerHTML="My First JavaScript";
        },
        headers: {
            "apikey":"eb0d7633268c4e4d346bd6cfa57a47e5"
        }
    };
    $.ajax(settings);
}