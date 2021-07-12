<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset='utf-8'>
  <meta http-equiv='X-UA-Compatible' content='IE=edge'>
  <title>Page Title</title>
  <meta name='viewport' content='width=device-width, initial-scale=1'>
  <link rel='stylesheet' type='text/css' media='screen' href='main.css'>
  <script src='main.js'></script>



  <style>
    body {
      font-family: Arial, Helvetica, sans-serif;
    }

    /* The Modal (background) */
    .modal {
      display: none;
      /* Hidden by default */
      position: fixed;
      /* Stay in place */
      z-index: 1;
      /* Sit on top */
      padding-top: 30px;
      /* Location of the box */
      left: 0;
      top: 0;
      width: 100%;
      /* Full width */
      height: 100%;
      /* Full height */
      overflow: auto;
      /* Enable scroll if needed */
      background-color: rgb(0, 0, 0);
      /* Fallback color */
      background-color: rgba(0, 0, 0, 0.4);
      /* Black w/ opacity */
    }

    /* Modal Content */
    .modal-content {
      background-color: #fefefe;
      margin: auto;
      padding: 20px;
      border: 1px solid #888;
      width: 80%;
    }

    /* The Close Button */
    .close {
      color: #aaaaaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .close:hover,
    .close:focus {
      color: #000;
      text-decoration: none;
      cursor: pointer;
    }
  </style>



</head>

<body>

<a href="file:///D:/projectPdf/Privacy%20Policy%20(6).pdf">padf</a>


	

	<!-- Trigger/Open The Modal -->
  <button id="myBtn">Open Modal</button>

  <!-- The Modal -->
  <div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
      <span class="close">&times;</span>


      <div>
        <embed
          src="./resources/privacy.pdf"
          type="application/pdf" align="center" width="100%" height="600px" />
      </div>
      <div class="comments" style="padding-top: 20px;">
        <form>
          <table id="addComment">
            <tr>
              <td>Reference:</td>
              <td><Input type="text" name="ref"></td>
            </tr>
            <tr>
              <td>Comment:</td>
              <td><textarea cols="22" rows="4" name="comment"></textarea></td>
            </tr>
          </table>

          <button onclick="addComment(); return false">Add</button>
          <input type="submit" value="Comment">
        </form>


      </div>
      <br><br><br><br>

    </div>

  </div>

  <script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];
    var comment = document.getElementById("addComment");
    // When the user clicks the button, open the modal 
    btn.onclick = function () {
      modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
      modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }

    function addComment() {

      var form = document.getElementById('addComment');
      console.log('create element called');

      var form = document.getElementById("addComment")
      var tr1 = document.createElement("tr");
      var tr2 = document.createElement("tr");

      var lableRef = document.createElement("td");
      var refTd = document.createElement("td");

      var lableComment = document.createElement("td");
      var commentTd = document.createElement("td");

      var refInput = document.createElement("input");
      var commentInput = document.createElement("textarea");

      lableRef.innerHTML = "Reference: ";
      lableComment.innerHTML = "Comment: ";

      refInput.setAttribute("name", "ref");
      commentInput.setAttribute("name", "comment");

      commentInput.cols = "22";
      commentInput.rows = "4";

      refTd.appendChild(refInput);
      commentTd.appendChild(commentInput);

      tr1.appendChild(lableRef);
      tr1.appendChild(refTd);
      tr2.appendChild(lableComment);
      tr2.appendChild(commentTd);

      form.appendChild(tr1);
      form.appendChild(tr2);




    }
  </script>
</body>

</html>
