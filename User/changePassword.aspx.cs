﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_changePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.Name == "")
        {
            Response.Redirect("createUser.aspx");
        }

    }

    protected void ContinuePushButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("profile.aspx");
    }
}