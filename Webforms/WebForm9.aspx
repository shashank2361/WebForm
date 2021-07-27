<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm9.aspx.cs"
    Trace="false" Inherits="Webforms.WebForm9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="Scripts/jquery-3.3.1.min.js"></script> 
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" />
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function () {
              $.noConflict();
             $('#EmployeesTbl').DataTable({

                 ajax: {
                    url: "http://localhost:58459/EmployeeService.asmx/GetAllEmployeesJson",
                    dataSrc: ""
                },
                columns: [
                    {
                        data: "EmployeeId"
                        //render: function (data, type, customer) {
                        //    return "<a href='/customer/edit/" + customer.id + "'>" + customer.name + "</a>";
                        //}
                    },
                    {
                        data: "Name",
                        // render: function (data, type, customer) {
                        //     return data  ;
                        //}
                    },

                    //{
                    //    data: "Gender",
                    //    // render: function (data, type, customer) {
                    //    //     return data  ;
                    //    //}
                    //},
                    //{
                    //    data: "City"

                    //}
                ]

            });






        });

        $(window).bind("load", function () {
            $.noConflict();
           $('#dataTable').DataTable();
        });

        $(window).bind("load", function () {
            $.noConflict();
           
        });


         
    </script>

    <title></title>
</head>
<body>



    <form class="form-horizontal " id="form1" runat="server">
        <div class="row">
            <div class="col-lg-5">
                <h1>CRUD usign object data source</h1>
                <div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                        DataKeyNames="EmployeeId" DataSourceID="ObjectDataSource1"
                        ShowFooter="True" BackColor="#DEBA84" BorderColor="#DEBA84"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3"
                        CellSpacing="2">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
                                    <asp:LinkButton ID="lbInsert" ValidationGroup="Insert"
                                        runat="server" OnClick="lbInsert_Click">Insert
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
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                    <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="Insert"
                        ForeColor="Red" runat="server" />
                    <asp:ValidationSummary ID="ValidationSummary2" ForeColor="Red"
                        runat="server" />



                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="DeleteEmployee" InsertMethod="InsertEmployee" SelectMethod="GetAllEmployees" TypeName="Webforms.EmployeeDataAccessLayer" UpdateMethod="UpdateEmployee">
                        <DeleteParameters>
                            <asp:Parameter Name="EmployeeId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Gender" Type="String" />
                            <asp:Parameter Name="City" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="EmployeeId" Type="Int32" />
                            <asp:Parameter Name="Name" Type="String" />
                            <asp:Parameter Name="Gender" Type="String" />
                            <asp:Parameter Name="City" Type="String" />
                        </UpdateParameters>
                    </asp:ObjectDataSource>

                </div>
                <div class="">

                    <asp:GridView ID="GridView2" class="col-lg-2" runat="server"
                        AutoGenerateColumns="False" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" OnRowDataBound="GridView2_RowDataBound" OnDataBound="GridView2_DataBound">
                        <Columns>
                            <asp:BoundField HeaderText="CheckBox" />
                            <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                            <asp:BoundField DataField="LastName" HeaderText="LastName" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" />
                            <asp:BoundField DataField="Salary" HeaderText="Salary" />
                            <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" />
                            <asp:BoundField DataField="Country" HeaderText="Country" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="DetailsButton" class="btn btn-primary" runat="server" Text='<%# Eval("Id") %>' Height="33px" Width="106px"
                                        CommandArgument='<%# Eval("Id") %>' OnClick="DetailsButton_Click" />
                                    &nbsp;
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"
                                CommandArgument='<%# Eval("Id") %>'>Link + ' <%# Eval("Id") %>' </asp:LinkButton>
                                    &nbsp;
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://www.google.com/">[HyperLink1]</asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    <div class="">
                        <asp:Label ID="CustomLabel" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="LableClickBtn" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="LinkClickBtn" runat="server"></asp:Label>


                        <br />


                    </div>
                    <br />



                </div>
                <div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EmployeeDB %>" SelectCommand="SELECT [ID], [FirstName], [LastName], [Gender], [Salary], [DateOfBirth], [Country] FROM [Employees]"></asp:SqlDataSource>

                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnDataBound="GridView3_DataBound">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                            <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                            <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth" />
                            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                        </Columns>
                    </asp:GridView>

                </div>
            </div>
            <br />
            <div class="col-lg-5">
                <div>
                    <%-- style="width: 50%; text-align: center; background-color: skyblue;--%>
                    <asp:PlaceHolder ID="DBDataPlaceHolder" runat="server"></asp:PlaceHolder>

                </div>

                <div>
                    <table>
                        <tr>
                            <td>Result From OutPutParameter StoredProc</td>
                            <td>
                                <asp:Label ID="Label5" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Result From ReturnValue StoredProc</td>
                            <td>
                                <asp:Label ID="Label6" runat="server"></asp:Label></td>
                        </tr>

                        <tr>
                            <td>Result From Combined StoredProc</td>
                            <td>
                                <asp:Label ID="Label7" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td>Result From Execute Scaler</td>
                            <td>
                                <asp:Label ID="Label8" runat="server"></asp:Label></td>
                        </tr>

                    </table>

                </div>

            </div>
             <br />
            <div class="col-lg-5">


                <table id="EmployeesTbl" class="table table-bordered table-hover">
    <thead>
        <tr>
            <th>EmployeeId</th>
            <th>Name</th>
            <%--<th>Gender </th>

            <th>City</th>
            --%>
        </tr>
    </thead>
         
     
</table>


            </div>



        </div>
        <br />
    </form>
</body>
</html>
