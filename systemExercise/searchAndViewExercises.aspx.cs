using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    SystemExerciseManager manager = new SystemExerciseManager();

    protected void Page_Load(object sender, EventArgs e)
    {
        exerciseAutoComplete.SourceList = manager.getExerciseNamesAC();
    }
    protected void exerciseSearchButton_Click(object sender, EventArgs e)
    {
        List<Exercise> foundExercises = manager.getExercisesByName(exerciseSearchBox.Text.Trim());
        ExerciseDDL.Items.Clear();
        if (foundExercises.Count != 0)
        {
            foreach (Exercise name in foundExercises)
            {
                ExerciseDDL.Items.Add(name.name);
            }
            ExerciseDDL_SelectedIndexChanged(sender, e);
        }
        else
            exerciesNotFound();
    }
    protected void MuscleGroupRBL_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<Exercise> foundExercises = manager.getExercisesByMuscleGroup(MuscleGroupRBL.SelectedValue.Trim());
        ExerciseDDL.Items.Clear();
        exerciseSearchBox.Text="";
        if (foundExercises.Count != 0)
        {
            foreach (Exercise name in foundExercises)
            {
                ExerciseDDL.Items.Add(name.name);
            }
            ExerciseDDL_SelectedIndexChanged(sender, e);
        }
        else
            exerciesNotFound();
    }
    protected void ExerciseDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        Exercise exercise = manager.getExercise(ExerciseDDL.SelectedValue);
        exerciseName.Visible = true;
        exerciseName.Text = exercise.name;
        exerciseEquipment.Visible = true;
        exerciseEquipment.Text = exercise.equipment;
        exerciseVideo.Visible = true;
        exerciseVideo.Text = exercise.videoLink;
        exerciseAttributes.Visible = true;
        exerciseAttributes.Text = "";
        if (exercise.weight)
            exerciseAttributes.Text += "Weight\n";
        if (exercise.rep)
            exerciseAttributes.Text += "Reps\n";
        if (exercise.time)
            exerciseAttributes.Text += "Time\n";
        if (exercise.distance)
            exerciseAttributes.Text += "Distance\n";
        exerciseEnabled.Visible = true;
        exerciseEnabled.Text = exercise.enabled.ToString();
    }
    protected void exerciesNotFound()
    {
        exerciseName.Visible = false;
        exerciseEquipment.Visible = false;
        exerciseVideo.Visible = false;
        exerciseAttributes.Visible = false;
        exerciseEnabled.Visible = false;
    }
}