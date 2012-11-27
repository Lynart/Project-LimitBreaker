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
        if (ddlSystemExercises.Items.Count < 1)
        {
            lblDeletionResult.Text = "Nothing in here to see";
        }
    }
    protected void btnDeleteExercise_Click(object sender, EventArgs e)
    {
        ExerciseManager deleter = new ExerciseManager();

        bool result = deleter.deleteExerciseById(Convert.ToInt32(ddlSystemExercises.SelectedItem.Value));

        if (result)
        {
            lblDeletionResult.Text = "it worked";
        }

        else
        {
            lblDeletionResult.Text = "it did not work";
        }
    }
}