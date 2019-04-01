
// Set up a dummy function so we don't pollute the global namespace
(function () {
  "use strict";

  var insertBugs = function(bugs) {
    var list = document.getElementById("bugList");
    list.getElementsByClassName("noneMarker")[0].hidden = true;
    bugs.forEach(function(bug){
      var newLI = document.createElement("li");
      var newText = document.createTextNode(bug.id + ", " + bug.title + ": " + bug.description);
      newLI.appendChild(newText);
      list.appendChild(newLI);
    });
  };


  var xmlToBugs = function (bugResponseXML) {

    var bugs = [];
    var bugListXML = bugResponseXML.getElementsByTagName("object");

    for (var i = 0; i < bugListXML.length; i++) {
      var bugXML = bugListXML[i];
      var bug = {
        title: bugXML.getElementsByTagName("id")[0].textContent,
        id: bugXML.getElementsByTagName("title")[0].textContent,
        description: bugXML.getElementsByTagName("description")[0].textContent
      };
      bugs.push(bug);

    }
    return bugs;
  };

  var loadBugs = function () {
    var ajax = new XMLHttpRequest();
    console.log("Click!");

    // Replace URL below with the URL for your server.
    ajax.open("GET", 'http://localhost:3000/bugs.xml');
    ajax.onreadystatechange = function () {
      console.log("Ajax state: " + ajax.readyState);
      if (ajax.readyState === 4 && ajax.status === 200) {
        console.log("Complete AJAX object:");
        console.log(ajax);
        var bugs = xmlToBugs(ajax.responseXML);
        insertBugs(bugs);
      } else if (ajax.readyState === 4 && ajax.status !== 200) {
        console.log("There was a problem.  Status returned was " + ajax.status);
      }
    };

    ajax.onerror = function () {
      console.log("There was an error!");
    };

    // Notice that send is asynchronous.  This method does not block,
    // instead, the code in onreadystatechange above runs when the call
    // is complete.
    ajax.send();
  };

// Don't apply the event listeners until the document has loaded.
  document.addEventListener("readystatechange", function () {
    console.log("Ready:  " + document.readyState);
    if (document.readyState === "interactive") {
      var loadButton = document.getElementById("loadButton");
      loadButton.addEventListener("click", loadBugs);
    }
  });
})();
