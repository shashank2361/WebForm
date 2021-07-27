using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webforms
{
    public partial class WebForm9 : System.Web.UI.Page
    {

        public string CS { get; set; } =
                ConfigurationManager.ConnectionStrings["EmployeeDB"].ConnectionString;

        protected void Page_Init(object sender, EventArgs e)
        {
            GridView3.DataBind();
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from [dbo].[Employees]", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView2.DataSource = ds;
                GridView2.DataBind();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //   PopulateGridView();          
            BindTableData();
            if (!IsPostBack)
            {
               AddLinkButton();
                 //AddCheckBox();
                DisplayValuesFromProcedures();    
            }
        }

        //protected void Page_LoadComplete(object sender, EventArgs e)
        //{
        //    String csname1 = "PopupScript";
        //    Type cstype = this.GetType();
        //    // Get a ClientScriptManager reference from the Page class.
        //    ClientScriptManager cs = Page.ClientScript;
        //    if (!cs.IsStartupScriptRegistered(cstype, csname1))
        //    {
        //        StringBuilder cstext1 = new StringBuilder();
        //        cstext1.Append("<script> $(document).ready(function () { $('#dataTable').DataTable(); }); </");
        //        cstext1.Append("script>");
        //        cs.RegisterStartupScript(cstype, csname1, cstext1.ToString());
        //    }
        //}

 



        private void BindTableData()
        {
            DataSet ds = new DataSet();
            StringBuilder htmlTable = new StringBuilder();       
            using (SqlConnection con = new SqlConnection(CS))
            {
                //SqlDataAdapter da = new SqlDataAdapter("select * from [dbo].[Employees]", con);

                SqlCommand cmd = new SqlCommand("select * from [dbo].[Employees]", con);
                SqlDataAdapter  da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                con.Open();
                cmd.ExecuteNonQuery();
                //da.Fill(ds);             
              
                //GridView2.DataSource = ds;
                //GridView2.DataBind();
            }
            htmlTable.Append("<table class='table table-hover table-striped table-bordered  ' border='1' id='dataTable' >");
            htmlTable.Append("<thead class='thead-dark'>");
            htmlTable.Append("<tr style='background-color:green; color: White;'>" +
                //"<th>Employee ID.</th>" +
                "<th>FirstName</th>" +
                "<th>LastName</th>" +
                "<th>Gender</th>" +
                "<th>Salary</th>" +
                "<th>Date Of Birth</th>" +
                "<th>Country</th>" +
                "" +
                "</tr>");

            htmlTable.Append("</thead>");
            htmlTable.Append("<tbody>"); 
            

            if (!object.Equals(ds.Tables[0], null))
            {
                if (ds.Tables[0].Rows.Count > 0)
                {

                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        htmlTable.Append("<tr style='color: Black;'>");
                        //htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["ID"] + "</td>");
                        htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["FirstName"] + "</td>");
                        htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["LastName"] + "</td>");
                        htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["Gender"] + "</td>");
                        htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["Salary"] + "</td>");
                        htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["DateOfBirth"] + "</td>");
                        htmlTable.Append("<td>" + ds.Tables[0].Rows[i]["Country"] + "</td>");
                        htmlTable.Append("</tr>");
                    }
                    htmlTable.Append("</tbody>");
                    htmlTable.Append("</table>");
                    DBDataPlaceHolder.Controls.Add(new Literal { Text = htmlTable.ToString() });
                }
                else
                {
                    htmlTable.Append("<tr>");
                    htmlTable.Append("<td align='center' colspan='4'>There is no Record.</td>");
                    htmlTable.Append("</tr>");
                }
            }





        }

        private void DisplayValuesFromProcedures()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spGetTotalCountOfEmployees", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter OutputValue = new SqlParameter("@TotalCount", SqlDbType.Int);
                OutputValue.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(OutputValue);
                con.Open();
                cmd.ExecuteNonQuery();
                Label5.Text = cmd.Parameters["@TotalCount"].Value.ToString();
            }
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spGetTotalCountOfEmployees2", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter OutputValue = new SqlParameter("@TotalCount", SqlDbType.Int);
                OutputValue.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(OutputValue);

                cmd.Parameters.Add("@NoOfEmployees", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
                con.Open();
                cmd.ExecuteNonQuery();
                var returnvalue = cmd.Parameters["@NoOfEmployees"].Value.ToString();
                Label6.Text = returnvalue.ToString();
            }

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spGetTotalCountOfEmployees2", con);

                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter OutputValue = new SqlParameter("@TotalCount", SqlDbType.Int);
                OutputValue.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(OutputValue);
                cmd.Parameters.Add("@NoOfEmployees", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

                con.Open();
                cmd.ExecuteNonQuery();
                var totalCount = cmd.Parameters["@TotalCount"].Value.ToString();
                var returnvalue = cmd.Parameters["@NoOfEmployees"].Value.ToString();
                Label7.Text = returnvalue.ToString() + " + " + totalCount;
            }

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spGetTotalCountOfEmployees3", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                var totalCount = (int)cmd.ExecuteScalar();
                Label8.Text = totalCount.ToString();
            }
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
        }

         
        protected void lbInsert_Click(object sender, EventArgs e)
        {
            ObjectDataSource1.InsertParameters["Name"].DefaultValue =
                ((TextBox)GridView1.FooterRow.FindControl("txtName")).Text;
            ObjectDataSource1.InsertParameters["Gender"].DefaultValue =
                ((DropDownList)GridView1.FooterRow.FindControl("ddlInsertGender")).SelectedValue;
            ObjectDataSource1.InsertParameters["City"].DefaultValue =
                ((TextBox)GridView1.FooterRow.FindControl("txtCity")).Text;
            ObjectDataSource1.Insert();
        }

 

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DetailsButton_Click(object sender, EventArgs e)
        {
            LableClickBtn.Text = Convert.ToInt32((sender as Button).CommandArgument).ToString();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
           LinkClickBtn.Text = Convert.ToInt32((sender as LinkButton).CommandArgument).ToString();
        }    

        private void AddCheckBox()
        {
            foreach (GridViewRow row in GridView2.Rows)
            {
                if (row.RowType == DataControlRowType.Header)
                {
                    row.Cells[0].Text = "CheckBox ";
                    //e.Row.Cells[0].Text = "Edit Buttons ";
                }
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox cb = new CheckBox();
                    row.Cells[0].Controls.Add(cb);
                    cb.Checked = true;
                }
            }         
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "CheckBox ";
                //e.Row.Cells[0].Text = "Edit Buttons ";
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                CheckBox cb = new CheckBox();
                e.Row.Cells[0].Controls.Add(cb);
                if (e.Row.Cells[3].Text == "Male" )
                {
                    cb.Checked = true;
                }   
            }
                //    //Button btnCustom = new Button();
                //    //e.Row.Cells[0].Controls.Add(btnCustom);
                //    //btnCustom.Text = e.Row.Cells[3].Text;
                //    //btnCustom.CommandArgument = e.Row.Cells[3].Text;
                //    //btnCustom.Click += new EventHandler(btnCustom_Click);
                //}
            }


        protected void btnCustom_Click(object sender, EventArgs e)
        {
            CustomLabel.Text =  (sender as Button).CommandArgument.ToString();
        }

        private void AddLinkButton()
        {
            foreach (GridViewRow row in GridView3.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    LinkButton lb = new LinkButton();
                    lb.Text = "Approve";
                    lb.CommandName = "ApproveVacation";
                    lb.Command += LinkButton_Command;
                    row.Cells[0].Controls.Add(lb);
                }
            }
        }

        private void LinkButton_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "ApproveVacation")
            {
                LinkButton lb = (LinkButton)sender;
                lb.Text = "OK";
            }
        }

        protected void GridView3_DataBound(object sender, EventArgs e)
        {
            AddLinkButton();
        }
        protected void GridView2_DataBound(object sender, EventArgs e)
        {
           // AddCheckBox();
        }
    }
}