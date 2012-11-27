using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;


/// <summary>
/// Summary description for Layer2Manager
/// </summary>
public class SystemExerciseManager
{
    System.Web.HttpApplication _context;

    public SystemExerciseManager()
    {
        //Reference to curent application instance
        _context = System.Web.HttpContext.Current.ApplicationInstance;
    }

    public List<Exercise> getAllExercises()
    {
        using (var context = new Layer2Container())
        {
            return context.Exercises.OrderBy(o => o.id).ToList();
        }
    }

    public List<Juice.AutocompleteItem> getExerciseNamesAC()
    {
        using (var context = new Layer2Container())
        {
            List<Juice.AutocompleteItem> rc = new List<Juice.AutocompleteItem>();
            // to make a new Juice.AutocompleteItem:
            // rc = new List<Juice.AutocompleteItem>(){new Juice.AutocompleteItem { Label = "", Value = "" }};

            // label is what shows up in the drop down list of names, value is what shows up on the textbox when a name is selected
            // return null if no entry in the database, otherwise display all exercises
            // did not check if it would be in ascending/descending order
            if (context.Exercises.Count() == 0)
            {
                rc = null;
            }
            else
            {
                rc = context.Exercises.Select(x => new Juice.AutocompleteItem { Label = x.name, Value = x.name }).ToList();
            }

            return rc;
        }
    }

   public bool createNewExercise(string exerciseName, string muscleGroups, string equipment, string videoLink, bool rep, bool weight, bool distance, bool time, bool enabled)
    {
        bool rc = false;

        using (var context = new Layer2Container())
        {
            Exercise newExercise = new Exercise();
            try { 
            if ((context.Exercises.FirstOrDefault(exercise => exercise.name == exerciseName).name == exerciseName))
                rc = false;              
            }
            catch (NullReferenceException e)
            {
                newExercise.name = exerciseName;
                newExercise.muscleGroups = muscleGroups;
                newExercise.equipment = equipment;
                newExercise.videoLink = videoLink;
                newExercise.rep = rep;
                newExercise.weight = weight;
                newExercise.distance = distance;
                newExercise.time = time;
                newExercise.enabled = enabled;

                context.Exercises.AddObject(newExercise);
                context.SaveChanges();
                rc = true;
            }
            return rc;
        }
    }

    public List<Exercise> getExercisesByName(string exerciseName)
    {
        using (var context = new Layer2Container())
        {
            //context.ContextOptions.LazyLoadingEnabled = false;
            var query = (from exercise in context.Exercises
                         where exercise.name.Contains(exerciseName)
                         select exercise);


            //context.LoadProperty(query, "MuscleGroups");
            return query.OrderBy(exercise => exercise.name).ToList();
        }
    }

    public List<Exercise> getExercisesByMuscleGroup(string muscleGroup)
    {
        using (var context = new Layer2Container())
        {
            //context.ContextOptions.LazyLoadingEnabled = false;
            var query = (from exercise in context.Exercises
                         where exercise.muscleGroups.Contains(muscleGroup)
                         select exercise);


            //context.LoadProperty(query, "MuscleGroups");
            return query.OrderBy(exercise => exercise.name).ToList();
        }
    }

    public Exercise getExercise(string exerciseName)
    {
        using (var context = new Layer2Container())
        {
            return context.Exercises.FirstOrDefault(exercise => exercise.name == exerciseName);
        }
    }
}