using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class systemExercise_ucEnableExercise : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
    }
    protected void rblEnaber_SelectedIndexChanged(object sender, EventArgs e)
    {
        disableManager enabler = new disableManager();

        try
        {
            if (Convert.ToInt32(rblEnaber.SelectedValue) == 1)
            {
                enabler.enableExerciseById(Convert.ToInt32(ddlExercises.SelectedItem.Value));
            }

            else if (Convert.ToInt32(rblEnaber.SelectedValue) == 0)
            {
                enabler.disableExerciseById(Convert.ToInt32(ddlExercises.SelectedItem.Value));
            }

            Response.Redirect("default.aspx");
        }

        catch (Exception exc)
        {

        }
    }
    protected void ddlExercises_SelectedIndexChanged(object sender, EventArgs e)
    {
        disableManager enabler = new disableManager();

        try
        {
            bool result = enabler.getExerciseEnabledValueById(Convert.ToInt32(ddlExercises.SelectedItem.Value));

            if (result)
            {
                rblEnaber.SelectedIndex = 0;
            }

            else
            {
                rblEnaber.SelectedIndex = 1;
            }
        }

        catch (Exception exc)
        {

        }
    }
}