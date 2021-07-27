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
    public partial class WebForm12 : System.Web.UI.Page
    {

        public string CS { get; set; } =
                ConfigurationManager.ConnectionStrings["EmployeeDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindTableData();
            }
        }
        private void BindTableData()
        {
            DataSet ds = new DataSet();
            StringBuilder htmlTable = new StringBuilder();
            using (SqlConnection con = new SqlConnection(CS))
            {
                //SqlDataAdapter da = new SqlDataAdapter("select * from [dbo].[Employees]", con);

                SqlCommand cmd = new SqlCommand("select * from [dbo].[Employees]", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
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
    }
}