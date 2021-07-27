<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm10.aspx.cs"
    Trace="false" Inherits="Webforms.WebForm10" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <asp:PlaceHolder runat="server">
        <%: System.Web.Optimization.Styles.Render("~/Content/AjaxControlToolkit/Styles/Bundle") %>
    </asp:PlaceHolder>


    
    <link href="Content/bootstrap.min.css" rel="stylesheet" />

 

    
     <script src="Scripts/jquery-3.3.1.min.js"></script>  
 


    <script src="Scripts/bootstrap.min.js"></script>


 <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js"   integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E="   crossorigin="anonymous"></script> 
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js" integrity="sha512-0bEtK0USNd96MnO4XhH8jhv3nyRF0eK87pJke6pkYf3cM0uDIhNJy9ltuzqgypoIFXw3JSuiy04tVk4AjpZdZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

 



  

<%--    <link href="Content/bootstrap-theme.min.css" rel="stylesheet" />--%>


    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }


        .seabackground {
            background-image: url("/images/sea.jpg");
            background-repeat: no-repeat;
            height: 100%;
        }



        .ModalPopupBG {
            background-color: #666699;
            filter: alpha(opacity=50);
            opacity: 0.7;
        }

        .popup_Container {
            background-color: #fffeb2;
            border: 2px solid #000000;
            padding: 0px 0px 0px 0px;
        }

        .popupConfirmation {
            width: 300px;
            height: 200px;
        }

        .popup_Titlebar {
            background: url(Images/titlebar_bg.jpg);
            height: 29px;
        }

        .popup_Body {
            padding: 15px 15px 15px 15px;
            font-family: Arial;
            font-weight: bold;
            font-size: 12px;
            color: #000000;
            line-height: 15pt;
            clear: both;
            padding: 20px;
        }

        .TitlebarLeft {
            float: left;
            padding-left: 5px;
            padding-top: 5px;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            font-size: 12px;
            color: #FFFFFF;
        }

        .TitlebarRight {
            background: url(Images/cross_icon_normal.png);
            background-position: right;
            background-repeat: no-repeat;
            height: 15px;
            width: 16px;
            float: right;
            cursor: pointer;
            margin-right: 5px;
            margin-top: 5px;
        }

        .popup_Buttons {
            margin: 10px;
        }


        /*    #sortable { list-style-type: none; margin: 0; padding: 0; width: 60%; }
  #sortable li { margin: 0 3px 3px 3px; padding: 0.4em; padding-left: 1.5em; font-size: 1.4em; height: 18px; }
  #sortable li span { position: absolute; margin-left: -1.3em; } 


        /* The Modal (background) */
        .modal {
            display: none;
            position: fixed;
            /*  z-index: 0;  
*/ padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
        }

        /*Modal Content*/
        .modal-content {
            position: relative;
            background-color: #fefefe;
            margin: auto;
            padding: 0;
            border: 1px solid #888;
            width: 80%;
            box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
            -webkit-animation-name: animatetop;
            -webkit-animation-duration: 0.4s;
            animation-name: animatetop;
            animation-duration: 0.4s
        }

        /* Add Animation */
        @-webkit-keyframes animatetop {
            from {
                top: -300px;
                opacity: 0
            }

            to {
                top: 0;
                opacity: 1
            }
        }

        @keyframes animatetop {
            from {
                top: -300px;
                opacity: 0
            }

            to {
                top: 0;
                opacity: 1
            }
        }

        /* The Close Button */
        .close {
            color: white;
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


        .modal-header {
            padding: 2px 16px;
            background-color: #5cb85c;
            color: white;
        }

        .modal-body {
            padding: 2px 16px;
        }

        .modal-footer {
            padding: 2px 16px;
            background-color: #5cb85c;
            color: white;
        }
    </style>



    <script>

        // Get the modal


        // When the user clicks on <span> (x), close the modal
        $("#close").onclick = function () {
            $('#myModal1').hide();
        }

        // When the user clicks anywhere outside of the modal, close it


        //$(function () {
           $( "#sortable" ).sortable();
        //  $("#sortable").disableSelection();

        //});
        
        function loadDetails(id) {
            console.log(id)
                        __doPostBack('btnlist'   , id);

            
             
        }

        function Getmessage(e) {
            ShowDialog(true);
            return false;
        }

        function ShowDialog(modal) {



            $.ajax({
                url: "studentservice.asmx/GetStudentNames",
                data: '{ searchItem:  "Mark" }',
                type: "POST",
                dataType: "json",
                contentType: "application/json;charset=utf-8",
                success: function (data) {

                    $("#myModal1").show();
                    $("#TextBoxModal1").val(data.d);
                    //response(data.d[0]);

                },
                error: function (result) {
                    alert('There is a problem processing your request');
                }
            });



            event.preventDefault();
            return false;

        }







    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="seabackground">
            <div>
                <h1>CRUD usign object without any  data source</h1>
                <p>&nbsp;</p>
                <%--Remove Command field and replace with template field--%>

                <div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="EmployeeId"
                        ShowFooter="True"
                        BackColor="Transparent" BorderColor="#DEBA84"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3"
                        CellSpacing="2" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound1" OnDataBound="GridView1_DataBound">

                        <Columns>

                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbEdit" CommandArgument='<%# Eval("EmployeeId") %>'
                                        CommandName="EditRow" ForeColor="#8C4510" runat="server">Edit</asp:LinkButton>
                                    <asp:LinkButton ID="lbDelete" CommandArgument='<%# Eval("EmployeeId") %>'
                                        CommandName="DeleteRow" ForeColor="#8C4510" runat="server"
                                        CausesValidation="false">Delete</asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lbUpdate" CommandArgument='<%# Eval("EmployeeId") %>'
                                        CommandName="UpdateRow" ForeColor="#8C4510" runat="server">Update</asp:LinkButton>
                                    <asp:LinkButton ID="lbCancel" CommandArgument='<%# Eval("EmployeeId") %>'
                                        CommandName="CancelUpdate" ForeColor="#8C4510" runat="server"
                                        CausesValidation="false">Cancel</asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>



                            <asp:TemplateField HeaderText="EmployeeId" InsertVisible="False"
                                SortExpression="EmployeeId">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server"
                                        Text='<%# Eval("EmployeeId") %>'>
                                    </asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server"
                                        Text='<%# Bind("EmployeeId") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:LinkButton ID="lbInsert"
                                        CommandName="InsertRow"
                                        ValidationGroup="Insert"
                                        runat="server">Insert
                                    </asp:LinkButton>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server"
                                        Text='<%# Bind("Name") %>'>
                                    </asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEditName" runat="server"
                                        ErrorMessage="Name is a required field"
                                        ControlToValidate="TextBox1" Text="*" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server"
                                        Text='<%# Bind("Name") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvInsertName" runat="server"
                                        ErrorMessage="Name is a required field"
                                        ControlToValidate="txtName" Text="*" ForeColor="Red"
                                        ValidationGroup="Insert">
                                    </asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server"
                                        SelectedValue='<%# Bind("Gender") %>'>
                                        <asp:ListItem>Select Gender</asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvEditGender" runat="server"
                                        ErrorMessage="Gender is a required field" Text="*"
                                        ControlToValidate="DropDownList1" ForeColor="Red"
                                        InitialValue="Select Gender">
                                    </asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server"
                                        Text='<%# Bind("Gender") %>'>
                                    </asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="ddlInsertGender" runat="server">
                                        <asp:ListItem>Select Gender</asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvInsertGender" runat="server"
                                        ErrorMessage="Gender is a required field" Text="*"
                                        ControlToValidate="ddlInsertGender" ForeColor="Red"
                                        InitialValue="Select Gender" ValidationGroup="Insert">
                                    </asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City" SortExpression="City">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server"
                                        Text='<%# Bind("City") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEditCity" runat="server"
                                        ErrorMessage="City is a required field" Text="*"
                                        ControlToValidate="TextBox3" ForeColor="Red">
                                    </asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server"
                                        Text='<%# Bind("City") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvInsertCity" runat="server"
                                        ErrorMessage="City is a required field" Text="*"
                                        ControlToValidate="txtCity" ForeColor="Red"
                                        ValidationGroup="Insert">
                                    </asp:RequiredFieldValidator>
                                </FooterTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <%-- <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
						<HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
						<PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
						<RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
						<SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
						<SortedAscendingCellStyle BackColor="#FFF1D4" />
						<SortedAscendingHeaderStyle BackColor="#B95C30" />
						<SortedDescendingCellStyle BackColor="#F1E5CE" />
						<SortedDescendingHeaderStyle BackColor="#93451F" />--%>
                    </asp:GridView>
                    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Insert"
                        ForeColor="Red" runat="server" />
                    <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red"
                        runat="server" />



                </div>
            </div>
        </div>

        <div>
            <br />
            <%--    <asp:Button ID="ButtonModal" runat="server" CssClass="btn btn-info btn-lg" data-toggle="modal"
				data-target="#myModal" Text="ButtonModal " OnClientClick="return false;" 
				UseSubmitBehavior="False"   />--%>

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                ButtonModal
            </button>




            <div id="myModal" class="modal fade" tabindex="-1" data-toggle="modal" role="dialog" aria-hidden="true">
                <div class="modal-dialog" role="document">

                
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Modal Header</h4>
                        </div>
                        <div class="modal-body">
                            <p>Some text in the modal without Data.</p>

                            <asp:TextBox ID="TextBoxModal" runat="server"></asp:TextBox>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>

                </div>
            </div>

        </div>

        <div>




            <asp:Button ID="ButtonModal1" runat="server" CssClass="btn btn-info btn-lg"
                Text="Button with dataModal" OnClick="ButtonModal1_Click1" />


            <!-- Modal content -->
            <asp:Panel runat="server" ID="myModal1Panel">
                <div runat="server" id="myModal1" class=" ">

                    <div class="modal-content">
                        <div class="modal-header">
                            <span id="close" class="close">&times;</span>
                            <h2>Modal Header</h2>
                        </div>
                        <div class="modal-body">
                            <p>Some text in the Modal Body</p>
                            <p>Some other text...</p>
                            <asp:TextBox ID="TextBoxModal1" runat="server"></asp:TextBox>

                        </div>
                        <div class="modal-footer">
                            <h3>Modal Footer</h3>
                             <asp:Button ID="CloseButton" runat="server" CssClass="btn btn-info btn-lg"
                Text="Close" OnClick="CloseButton_Click" />

                        </div>
                    </div>
                </div>

            </asp:Panel>



            <asp:ScriptManager ID="scriptmanager1" runat="server">
                <Scripts>
                    <asp:ScriptReference Path="~/Scripts/AjaxControlToolkit/Bundle" />
                </Scripts>

            </asp:ScriptManager>


            <%--           <asp:UpdatePanel ID="updatepnl" runat="server">  
<ContentTemplate>  
	</ContentTemplate>  
</asp:UpdatePanel> --%>


            <asp:Button ID="btnOpenPopUp" runat="server" Text="Open PopUp" Width="112px" />
            &nbsp;&nbsp;&nbsp;
			<br />
            <br />
            <asp:Label ID="lblHidden" runat="server" Text=""></asp:Label>

            <ajaxToolkit:ModalPopupExtender ID="mpePopUp"
                TargetControlID="btnOpenPopUp"
                CancelControlID="btnCancel"
                PopupControlID="Panel1" BackgroundCssClass="ModalPopupBG"
                PopupDragHandleControlID="PopupHeader" Drag="true"
                runat="server">
            </ajaxToolkit:ModalPopupExtender>

            <asp:Panel ID="Panel1" Style="display: none" runat="server">

                <div id="popupModal" class="   " tabindex="-1">


                    <div class="modal-dialog" role="document">
                        <div id="divPopUp" class="modal-content">
                            <div class="modal-header" id="PopupHeader">Header</div>
                            <div id="main" class="main">Main PopUp </div>
                            <div class="modal-body">
                                <iframe id="frameeditexpanse" frameborder="0" src="InnerPage.aspx" height="161"></iframe>
                            </div>

                            <div id="buttons" class="modal-footer">
                                <div id="DivbtnOK">
                                    <asp:Button ID="btnOk" OnClick="btnOk_Click1" CssClass="btn btn-default" runat="server" Text="Ok" />
                                </div>
                                <div id="Divbtncancel">
                                    <asp:Button ID="btnCancel" CssClass="btn btn-primary" runat="server" Text="Cancel" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </asp:Panel>
            <br />
            <br />

        </div>








        <br />
        <div class="col-md-12">
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        </div>



         <br />
    

        <br />
        <br />

        <asp:Repeater   ID="rptEmpName"   OnItemCommand="rptAlphabet_ItemCommand" runat  ="server" >
            <HeaderTemplate><ul  class="col-md-12 nameList"></HeaderTemplate>
            <ItemTemplate>
                    <li class="ui-state-default"> 
                  <span>      <asp:LinkButton ID="LinkButton1" runat="server" CssClass="  ui-icon-arrowthick-2-n-s" Text='<%# Eval("Name") %>'
                    CommandArgument='<%# Eval("EmployeeId") %>' /> 
                      </span>
                &nbsp

                    </li>
             </ItemTemplate>
             <FooterTemplate><ul/></FooterTemplate>
        </asp:Repeater>

                            


    </form>
</body>
</html>
