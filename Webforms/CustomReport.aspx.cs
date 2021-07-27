using Microsoft.Reporting.WebForms;
using System;
 

namespace Webforms
{
    public partial class CustomReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //ReportViewer1.ProcessingMode = ProcessingMode.Remote;

            }
        }
    }
}