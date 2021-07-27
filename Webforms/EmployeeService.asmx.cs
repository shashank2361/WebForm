using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace Webforms
{
    /// <summary>
    /// Summary description for EmployeeService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1 ) ]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class EmployeeService : System.Web.Services.WebService
    {
        
        [WebMethod]
        public List<EmployeeDataAccessLayer.Employee> GetAllEmployees(/*bool _search, int nd, int rows   , int page   , string sidx   , string sord*/  )
        {
            return EmployeeDataAccessLayer.GetAllEmployees();

        }
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]

        [WebMethod]
        public List<EmployeeDataAccessLayer.Employee> GetAllEmployeesJson(/*bool _search, int nd, int rows   , int page   , string sidx   , string sord*/  )
        {
            return EmployeeDataAccessLayer.GetAllEmployees();

        }


    }
}
