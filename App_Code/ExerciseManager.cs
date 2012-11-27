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

    public List<Exercise> getExercises() 
    {
        using (var context = new Layer2Container())
        {
            return context.Exercises.OrderBy(s => s.name).ToList();
        }
    }

    public bool deleteExerciseById(int id)
    {
        bool result = true;
        using (var context = new Layer2Container())
        {
            try
            {
                var exercise = context.Exercises.Where(s => s.id == id).FirstOrDefault();

                //var exp = context.ExerciseExps.Where(s => s.Exercise.id == id).FirstOrDefault(); // Make it so it only works when there is a related ExerciseExp
                //context.ExerciseExps.DeleteObject(exp);

                exercise.LoggedExercise.Clear();
                exercise.ScheduledExercises.Clear();
                //ExerciseGoal doesn't have a navigation property

                context.Exercises.DeleteObject(exercise);
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