<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Profile Picture Upload</title>
    <style>
        /* Hide the default appearance of the file input field */
        #file {
            display: none;
        }
        
        img{
            width: 100px;
        }

        /* Style the label to look like a button */
        .upload-btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        /* Style the label on hover */
        .upload-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Upload Profile Picture</h2>
    
    <%-- Retrieve filepath from request attribute --%>
    <% String filepath = (String) request.getAttribute("filepath"); %>
    <%-- Check if filepath is not null or empty --%>
    <% if (filepath != null && !filepath.isEmpty()) { %>
        <div>
            <%-- Construct the image source URL relative to the context path --%>
            <img src="${pageContext.request.contextPath}/uploads/<%= new File(filepath).getName() %>" alt="Uploaded Picture">
        </div>
    <% } else { %>
        <p>No picture uploaded yet.</p>
    <% } %>
    
    <form id="uploadForm" action="UploadServlet" method="post" enctype="multipart/form-data">
        <!-- Label for file input field -->
        <label for="file" class="upload-btn">Upload Photo</label>
        <!-- File input field -->
        <input type="file" name="file" id="file" accept="image/*">
    </form>
    
    <script>
        // Get the file input element
        var fileInput = document.getElementById("file");

        // Function to check if file input has changed and submit the form
        function checkFileInput() {
            if (fileInput.value !== "") {
                document.getElementById("uploadForm").submit(); // Submit the form if file is selected
            }
        }

        // Add event listener to detect changes in the file input
        fileInput.addEventListener("change", function() {
            // Use a timer to check if file input has changed after a short delay (100 milliseconds)
            setTimeout(checkFileInput, 100);
        });
    </script>
</body>
</html>
