using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class main_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlGenericControl li = (HtmlGenericControl)this.Page.Master.FindControl("Ulnav").FindControl("lihome");
        li.Attributes.Add("class", "active");
    }
}