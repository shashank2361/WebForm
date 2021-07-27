using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Webforms
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            myModal1Panel.Visible = false;
            if (!IsPostBack)
            {
                BindGridViewData();
                BindList();
                Session["PostID"] = "1001";
                ViewState["PostID"] = Session["PostID"].ToString();
            }


            var validPost = IsValidPost();
            if (validPost)
            {
                var xx = Request["__EVENTARGUMENT"];
                if (  Request["__EVENTTARGET"]?.ToString() == "btnlist" )
                {
                    if (!myModal1Panel.Visible)
                    {
                        myModal1Panel.Visible = true;
                         TextBoxModal1.Text = Request["__EVENTARGUMENT"];

                    }
                   

                }
            }



          






        }

        public bool IsValidPost()
        {
            if (ViewState["PostID"].ToString()
                == Session["PostID"].ToString())
            {
                Session["PostID"] =
                (Convert.ToInt16(Session["PostID"]) + 1).ToString();

                ViewState["PostID"] = Session["PostID"].ToString();

                return true;
            }
            else
            {
                ViewState["PostID"] =
                 Session["PostID"].ToString();

                return false;
            }

        }


        private void BindList()
        {

            var childs = EmployeeDataAccessLayer.GetAllEmployees();
            StringBuilder output = new StringBuilder();
         


            if (childs.Count > 0)
            {
                

                //if children are there append another list to the parent node
                output.Append("<ul id=\"sortable\" class=\"list-group ui-sortable \">");
                childs.ForEach(x =>
                {
                    var objList = new List<object>();
                    objList.Add(x.EmployeeId.ToString());
                    objList.Add(x.Name);

                    var resultString = string.Join(",", objList.Cast<string>());


                    output.AppendFormat     ("<li class=\"list-group-item ui-state-default ui-sortable-handle \" id=\"btn_{0} \"   onclick=\"javascript:loadDetails({0} )\"> <span class=\"ui-icon ui-icon-arrowthick-2-n-s\"></span><a href=\"#\">{1}</a>", x.EmployeeId , x.Name);
                        output.Append("</li>");

                });
               output.Append("</ul>");

                Literal1.Text = output.ToString();

                var lstName = EmployeeDataAccessLayer.GetAllEmployees();
                
                rptEmpName.DataSource = lstName;
                rptEmpName.DataBind();


            }


 
 



        }


        protected void btnlist_Click(object sender, EventArgs e)

        {

            var xx = Request["__EVENTARGUMENT"];

             var yy = Request["__EVENTTARGET"]; 

        }


        protected void rptAlphabet_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            var id = e.CommandArgument.ToString();
            var validPost = IsValidPost();
            if (validPost)
            {
                var xx = Request["__EVENTARGUMENT"];
                
                    if (!myModal1Panel.Visible)
                    {
                        myModal1Panel.Visible = true;
                        TextBoxModal1.Text = id.ToString() ;

                    }


               
            }


        }

        private void BindGridViewData()
        {
            GridView1.DataSource = EmployeeDataAccessLayer.GetAllEmployees();
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditRow")
            {
                var rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;

                GridView1.EditIndex = rowIndex;
                BindGridViewData();
            }
            else if (e.CommandName == "DeleteRow")
            {
                System.Web.UI.ClientScriptManager cs = Page.ClientScript;

                EmployeeDataAccessLayer.DeleteEmployee(Convert.ToInt32(e.CommandArgument));

                BindGridViewData();

            }
            else if (e.CommandName == "CancelUpdate")
            {
                GridView1.EditIndex = -1;
                BindGridViewData();
            }

            else if (e.CommandName == "UpdateRow")
            {
                int rowIndex = ((GridViewRow)((LinkButton)e.CommandSource).NamingContainer).RowIndex;

                int employeeId = Convert.ToInt32(e.CommandArgument);
                string name = ((TextBox)GridView1.Rows[rowIndex].FindControl("TextBox1")).Text;
                string gender = ((DropDownList)GridView1.Rows[rowIndex].FindControl("DropDownList1")).SelectedValue;
                string city = ((TextBox)GridView1.Rows[rowIndex].FindControl("TextBox3")).Text;

                EmployeeDataAccessLayer.UpdateEmployee(employeeId, name, gender, city);

                GridView1.EditIndex = -1;
                BindGridViewData();
            }
            else if (e.CommandName == "InsertRow")
            {
                string name = ((TextBox)GridView1.FooterRow.FindControl("txtName")).Text;
                string gender = ((DropDownList)GridView1.FooterRow.FindControl("ddlInsertGender")).SelectedValue;
                string city = ((TextBox)GridView1.FooterRow.FindControl("txtCity")).Text;

                EmployeeDataAccessLayer.InsertEmployee(name, gender, city);

                BindGridViewData();
            }

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }



        [WebMethod]
        [ScriptMethod(UseHttpGet = true,
 ResponseFormat = ResponseFormat.Json, XmlSerializeString = false)]
        public string message()
        {

            return "Hello";
        }
 

    



        protected void ButtonModal1_Click1(object sender, EventArgs e)
        {
                TextBoxModal1.Text = "aaaaa";

            var validPost = IsValidPost();
            if (validPost)
            {
                myModal1Panel.Visible = true;

            }


            //string jsquery = "$('#myModal1').show(); " +
            //    "$('#close').on('click', function() { $('#myModal1').hide(); });";

 


            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal1", jsquery  , true);
            //   upModal.Update();

        }


        protected void CloseButton_Click(object sender, EventArgs e)
        {
            if ( myModal1Panel.Visible)
            {
                var validPost = IsValidPost();
                if (validPost)
                {
                    myModal1Panel.Visible = false;

                }

            }
              

            //  Response.Redirect(Request.Url.ToString(), false);

        }




        protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
         
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                GridView1.Rows[i].BackColor = Color.Transparent;
            }
        }


        protected void btnOpenPopUp_Click(object sender, ImageClickEventArgs e)
        {
            mpePopUp.Show();
        }
        
            //Do Work

          
       
        protected void btnCancel_Click(object sender, ImageClickEventArgs e)
        {
            //Do Work

            mpePopUp.Hide();
        }

        protected void btnOk_Click1(object sender, EventArgs e)
        {
            mpePopUp.Hide();
 
        }
    }
}