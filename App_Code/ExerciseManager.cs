using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ExerciseManager
/// </summary>
public class ExerciseManager
{
	public ExerciseManager()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public List<ExerciseBase> getExercises() 
    {
        using (var context = new Layer2Container())
        {
            return context.ExerciseBases.OrderBy(s => s.name).ToList();
        }
    }

    public bool deleteExerciseById(int id)
    {
        bool result = true;
        using (var context = new Layer2Container())
        {
            try
            {
                var exercise = context.ExerciseBases.Where(s => s.id == id).FirstOrDefault();

                exercise.MuscleGroups.Clear();
                exercise.LoggedExercise.Clear();
                exercise.ScheduledExercises.Clear();
                //ExerciseGoal doesn't have a navigation property
                context.ExerciseBases.DeleteObject(exercise);
                context.SaveChanges();
            }

            catch (Exception e)
            {
                result = false;
            }
        }

        return result;
    }
}