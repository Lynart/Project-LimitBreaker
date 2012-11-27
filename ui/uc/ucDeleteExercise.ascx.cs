using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class systemExercise_ucDeleteExercise : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnDeleteExercise_Click(object sender, EventArgs e)
    {
        ExerciseManager deleter = new ExerciseManager();

        try
        {
            bool result = deleter.deleteExerciseById(Convert.ToInt32(ddlSystemExercises.SelectedItem.Value));

            if (result)
            {
                lblDeletionResult.Text = "The exercise has been removed";
                Response.Redirect("default.aspx");
            }

            else
            {
                lblDeletionResult.Text = "Something went wrong with the database deletion";
            }
        }

        catch (Exception exc)
        {
            lblDeletionResult.Text = "Something went wrong with the execution of the page";
        }
    }
}