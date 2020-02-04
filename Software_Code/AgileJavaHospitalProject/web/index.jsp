
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"  crossorigin="anonymous">
    <link href="fontawesome-free/css/all.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/51b16e748f.js" crossorigin="anonymous"></script>
    <title>Treatment Finder</title>
    <script>
        function updateTextInput(val) {
          document.getElementById('textInput').value=val;
        }
    </script>
    <%
        String search = request.getParameter("desc");
        String location = request.getParameter("location");
        String d = request.getParameter("distance");
        String p = request.getParameter("price");
        int price = 300000;
        int distance = 0;
        String error = request.getParameter("error");
        if(search == null) search="";
        if(location == null) location="";
        if(d == null);
        else distance = Integer.parseInt(d);
        if(p == null); 
        else price = Integer.parseInt(p);
        if(error == null) error="0";
        else error = "1";
    %>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
   <div class="container">
     <a class="navbar-brand" href="index.html"><h4>Treatment <span class="accent">Finder</span></h4></a>
   </div>
 </nav>

    <main role="main">
      <div id="header" class="container">
        <br>
        <h1>Let's find you some affordable</h1>
        <h1>health care!</h1>
      <form action="search.jsp" method="post">
        <br>


        <!--Start of row 1-->
        <div class="form-group">
        <div class="row">
          <div class="col">
              <input name="desc" type="text" value="<% out.print(search); %>" class="form-control form-control-lg" placeholder="What are you looking for?" list="dataListForSelect" required/>
                <datalist id="dataListForSelect" >

                    <option value="ALCOHOL/DRUGS" />
                    <option value="BACK PROBLEMS" />
                    <option value="BONE" />
                    <option value="DIABETES" />
                    <option value="FRACTURES" />
                    <option value="HEART" />
                    <option value="HEMORRHAGE" />
                    <option value="ISCHEMIA" />
                    <option value="KIDNEY" />
                    <option value="MOUTH" />
                    <option value="NECK" />
                    <option value="PNEUMONIA" />
                    <option value="SEIZURES" />
                    <option value="RESPIRATORY" />

                </datalist>

          </div>
        </div>
        </br>
          <!--Start of row 2-->
          <div class="row">
            <div class="col">
                <input id="browser-location-lat" name="browser-location-lat" type="hidden">
                <input id="browser-location-lon" name="browser-location-lon" type="hidden">
                <div class="input-group">
                    <input id="location-input" name="location" type="text" class="form-control form-control-lg" value="<% out.print(location); %>" placeholder="Where are you from?" aria-label="Recipient's username" aria-describedby="basic-addon2" required>
                <div class="input-group-append">
                    <button id="own-location" class="btn btn-primary" type="button"><i class="fas fa-map-pin"></i></button>
                  </div>
                </div>
            </div>
            <div class="col">
              <select name="max-distance" class="form-control form-control-lg" id="exampleFormControlSelect1">
                  <option value="0" <%if(distance==0)out.print("selected=\"true\""); %>>How far are you willing to travel?</option>
                <option value="25" <%if(distance==25)out.print("selected=\"true\""); %>>25 miles</option>
                <option value="50" <%if(distance==50)out.print("selected=\"true\""); %>>50 miles</option>
                <option value="100" <%if(distance==100)out.print("selected=\"true\""); %>>100 miles</option>
                <option value="200" <%if(distance==200)out.print("selected=\"true\""); %>>200 miles</option>
                <option value="400" <%if(distance==400)out.print("selected=\"true\""); %>>400 miles</option>
              </select>
            </div>
          </div>
            </br>
          <!--Start of row 3-->
          <div class="slidecontainer col-13">
                    <label>Maximum Price</label>
                    <input type="range" class="custom-range" name="rangeInput" min="1" max="600000" onchange="updateTextInput(this.value);">
                    <label>$<input type="text" name="price" value="<% out.print(price); %>" id="textInput" value="300000" style="border: none;"></label>
          </div>
        </div>
          
          <% 
            if(error == "1") out.print("<t1><font color=\"red\">No result. Please change options for more results</font></t1>");
            else out.print("</br>");
          %>
          <button type="submit" class="btn btn-primary btn-block search-button">Search</button>
        </div>
      </form>
    </main>

    <footer class="py-5">
      <div class="container">
        <div class="row">

          <h6>� Craneware 2020</h6>
          <div class="float-right">
            <i class="fab fa-twitter-square fa-2x fa-fw"></i><i class="fab fa-facebook fa-2x fa-fw"></i><i class="fab fa-instagram fa-2x fa-fw"></i>
          </div>
        </div>

    </div>
    </footer>
      <script>
    var bLocationLat = document.getElementById("browser-location-lat");
    var bLocationLon = document.getElementById("browser-location-lon");
    function getLocation() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
      } else {
        document.getELementById("location-input").value = "New York";
      }
    }
    
    $("#own-location").on("click", function(){
       if($("#location-input").prop("disabled")) {
           $("#location-input").prop("disabled", false);
           $("#location-input").prop("required", true);
           $("#location-input").attr("placeholder", "Where are you from?");
           return;
       }
       $("#location-input").attr("placeholder", "Using your location");
       $("#location-input").prop("required", false);
       $("#location-input").prop("disabled", true);
       
    });

    function showPosition(position) {
      bLocationLat.value = position.coords.latitude;
      bLocationLon.value = position.coords.longitude;
    }
    
    getLocation();
   
    </script>
  </body>
</html>
