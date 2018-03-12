<%
  session.timeout = 1
  session("nama") = "Daim"
%>
<html>
<head>

  <script>
    var sessionValue = parseInt('<%=session.timeout%>') * 60;
    var idleFor = 30; //set to how long idle before the message pop up
    var bufferValue = 25; //set how long if user didn't respond to popup to send user straight to log out page
    var sessionBuffer = bufferValue;
    var curSession = sessionValue;
    var test = document.getElementById("sessionContainer");

    window.onload = function() {
      //var curSession = ;
      function updateTimer() {
        curSession = calcTimer(curSession);
        if(document.getElementById('txtCounter') != undefined) {
          sessionBuffer -= 1;
          //document.getElementById('txtCounter').innerHTML = curSession;
          document.getElementById('txtCounter').innerHTML = returnCountdown(sessionBuffer);
        }
        if(curSession == idleFor) {
          document.body.appendChild(createPopup(sessionBuffer));
        }else if(curSession <= 0 || sessionBuffer <= 0) {
          LogOut();
        }
      }

      if(curSession != 0) {
        setInterval(updateTimer, 1000);
      }
    }

    function calcTimer(e) {
        if(e != 0) {
          e -= 1;
          return e;
        }
    }

    function createPopup(e) {
      var tmpCss = "position:absolute;top: 0%;left: 0%;  width: 100%;";
      tmpCss = tmpCss + "height: 100%;background-color: #ababab;z-index: 1001;";
      tmpCss = tmpCss + "-moz-opacity: 0.8;opacity: .70;filter: alpha(opacity=80);"
      var outerDiv = createButton("div","sessionContainer", '', '',tmpCss);
      var divContainer = document.createElement("div");
      divContainer.id = "innerSession";
      //divContainer.className = "divContainer";
      divContainer.innerHTML = "Sesi anda akan tamat dalam <br/>";
      divContainer.appendChild(createButton("span","txtCounter", returnCountdown(e), ''));
      divContainer.innerHTML = divContainer.innerHTML + "<br/>";
      divContainer.style.cssText = "z-index:1002;text-align:center;position:absolute; border:1px solid black; ";
      divContainer.style.cssText += "left:45%;top:45%;padding:10px 10px 10px 10px;background-color:white;";
      divContainer.appendChild(createButton("button", "Cont", "Teruskan", extendTimeout));
      divContainer.appendChild(createButton("button", "LogOutX", "LogOut", LogOut));
      outerDiv.appendChild(divContainer);
      return outerDiv;
    }

    function extendTimeout(x) {
      if(document.getElementById("sessionContainer") != undefined) {
        destroyDiv(document.getElementById("sessionContainer"));
      }

      sessionBuffer = bufferValue;
      //alert(x);
      if(x == undefined || x != "reset") {
        curSession = ajaxFC(ajaxFab());
      } else {
        curSession = sessionValue;
      }

    }

    function LogOut() {
      alert("Sesi Tamat");
      destroyDiv(document.getElementById("sessionContainer"));
      location.href = "logout.asp";
    }

    function createButton(elem, id, text, funcName, styleText) {
      var tmpBtn = document.createElement(elem);
      tmpBtn.innerHTML = text;
      tmpBtn.id = id;
      tmpBtn.name = id;
      if(funcName != "") {
        tmpBtn.addEventListener("click", funcName);
      }

      if(styleText != undefined) {
        tmpBtn.style.cssText = styleText;
      }

      return tmpBtn;
    }

    function destroyDiv(e) {
      if(e != undefined) {
        document.body.removeChild(e);
      }
    }

    function ajaxFab()
    {
    var xmlhttp;
    if (window.XMLHttpRequest)
      {
      // code for IE7+, Firefox, Chrome, Opera, Safari
      xmlhttp=new XMLHttpRequest();
      }
    else if (window.ActiveXObject)
      {
      // code for IE6, IE5
      xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    else
      {
      alert("Your browser does not support XMLHTTP!Contact the administrator");
      }
    	return xmlhttp;
    }

    function ajaxFC(e) {
    	var x = 0;
    	e.onreadystatechange = function() {
    		try {
    			if(this.readyState == 4 && this.status == 200) {
              curSession = this.responseText * 60;
              sessionValue = curSession;
    		    }
    		} catch (e) {
    			//alert(e);
    			//alert(this.responseText);
    		} finally {
    		}
    	};

    	e.open("POST", "refreshTimeout.asp", true);
    	e.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    	e.timeout = 0;
    	e.send("");
      //to send post value, just put the value inside the e.send();
    }

    function resetTimeout() {
      extendTimeout('reset');
    }

    function returnCountdown(e) {
      var secondPerMinute = 60;
      var minutePerHour = secondPerMinute;
      var second = parseInt(e%secondPerMinute);
      var minute = parseInt(Math.floor(e/secondPerMinute));
      var hour = parseInt(Math.floor(minute/minutePerHour));
      return hour + " jam " + minute + " minit " + second + " saat ";
    }

///////////////////////////koding hanya untuk testing///////////////////////////
    function openPages(x) {
      if(x == "a") {
        document.getElementById("sources").src = "test2.asp";
      } else {
        document.getElementById("sources").src = "test.asp";
      }
    }
///////////////////////////koding hanya untuk testing///////////////////////////
  </script>
</head>
<body>
  <button onclick="return openPages('a');">
    a
  </button>
  <button onclick = "return openPages('b');">
    b
  </button>
  <br/><br/>
  <iframe id = "sources" onload="return resetTimeout();" src=""></iframe>
</body>
</html>
