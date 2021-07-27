<%@ Page Language="C#" AutoEventWireup="true" Trace="false" CodeBehind="WebForm12.aspx.cs" Inherits="Webforms.WebForm12" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/ui.multiselect.css" rel="stylesheet" />
 

     
</head>
<body>
    <form id="form1" runat="server">
        <div>
 <h2>
        Welcome To   JQGrid Demo
    </h2>
    <table id="jQGridDemo">
    </table>
    <div id="jQGridDemoPager">
    </div>

            <br />
            <br />
            <br />
            
            <div>
                    <%-- style="width: 50%; text-align: center; background-color: skyblue;--%>
                    <asp:PlaceHolder ID="DBDataPlaceHolder" runat="server"></asp:PlaceHolder>

                </div>


            </div>
    </form>
</body>
</html>
