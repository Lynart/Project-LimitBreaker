using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class systemExercise_modifySystemExercises : System.Web.UI.Page
{
    SystemExerciseManager manager = new SystemExerciseManager();

    protected void Page_Load(object sender, EventArgs e)
    {
        exerciseAutoComplete.SourceList = manager.getExerciseNamesAC();
        Panel1.Visible = false;
    }

    protected void initBoxes() 
    {
        for (int i = 0; i < cblAttributes.Items.Count; i++)
        {
            cblAttributes.Items[i].Selected = false;
        }
        for (int i = 0; i < cblMuscleGroups.Items.Count; i++)
        {
            cblMuscleGroups.Items[i].Selected = false;
        }
    }

    protected void populateForm()
    {
        Exercise foundExercise = manager.getExerciseInfo(manager.getExerciseID(exerciseSearchBox.Text.Trim()));
        String[] muscleGroups;
        initBoxes();

        if (foundExercise != null)
        {
            muscleGroups = manager.splitMuscleGroups(foundExercise.muscleGroups);
            Panel1.Visible = true;
            if (foundExercise.rep)
                cblAttributes.Items[0].Selected = true;
            if (foundExercise.weight)
                cblAttributes.Items[1].Selected = true;
            if (foundExercise.distance)
                cblAttributes.Items[2].Selected = true;
            if (foundExercise.time)
                cblAttributes.Items[3].Selected = true;
            if (foundExercise.enabled)
                cblAttributes.Items[4].Selected = true;

            foreach (String muscle in muscleGroups)
            {
                //Response.Write(muscle +"<br>");
                switch (muscle)
                {
                    case "Chest":
                        cblMuscleGroups.Items[0].Selected = true;
                        break;
                    case "Back":
                        cblMuscleGroups.Items[1].Selected = true;
                        break;
                    case "Shoulder":
                        cblMuscleGroups.Items[2].Selected = true;
                        break;
                    case "Arms":
                        cblMuscleGroups.Items[3].Selected = true;
                        break;
                    case "Legs":
                        cblMuscleGroups.Items[4].Selected = true;
                        break;
                    case "Cardio":
                        cblMuscleGroups.Items[5].Selected = true;
                        break;

                }
            }

            tbExerciseName.Text = foundExercise.name;
            tbVideoLink.Text = foundExercise.videoLink;
            tbEquipment.Text = foundExercise.equipment;
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        populateForm();
    }

    protected void btnConfirmChanges_Click(object sender, EventArgs e)
    {
        bool rep = false, wieght = false, time = false, distance = false, enabled = false;
        string muscleGroups = "";


        if (cblAttributes.Items[0].Selected)
            rep = true;
        if (cblAttributes.Items[1].Selected)
            wieght = true;
        if (cblAttributes.Items[2].Selected)
            distance = true;
        if (cblAttributes.Items[3].Selected)
            time = true;
        if (cblAttributes.Items[4].Selected)
            enabled = true;

        foreach (ListItem item in cblMuscleGroups.Items)
        {
            if (item.Selected)
                muscleGroups += item.Text + System.Environment.NewLine;
        }

        if (manager.modifyExercise(manager.getExerciseID(exerciseSearchBox.Text.Trim()), tbExerciseName.Text, muscleGroups, tbEquipment.Text, tbVideoLink.Text, rep, wieght, distance, time, enabled) && tbExerciseName.Text != "")
        {
            lblResult.ForeColor = System.Drawing.Color.Green;
            lblResult.Text = "Added Succesfully!";
        }
        else
        {
            lblResult.ForeColor = System.Drawing.Color.Red;
            lblResult.Text = "Something went wrong";
        }

        if (tbExerciseName.Text == "")
        {
            lblResult.ForeColor = System.Drawing.Color.Orange;
            lblResult.Text = "Please enter an exercise name";
        }


        populateForm();
    }
}