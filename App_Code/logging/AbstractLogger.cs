using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Contains an interface with implementations for logging exercises
/// </summary>
public abstract class AbstractLogger
{
    protected ExperienceManager expMngr;

    public AbstractLogger()
    {
        expMngr = new ExperienceManager();
    }

    public List<LoggedExercise> getLoggedExercises(Int32 userID, Int32 exerciseID)
    {
        using (var context = new Layer2Container())
        {
            return context.LoggedExercises.Where(log => log.Exercise.id == exerciseID && log.LimitBreaker.id == userID).OrderByDescending(log => log.timeLogged).ToList();
        }
    }

    public List<LoggedExercise> getLoggedExercisesFromRoutine(Int32 userID, Int32 routineID)
    {
        using (var context = new Layer2Container())
        {
            return context.LoggedExercises.Where(log => log.LimitBreaker.id == userID && log.Routine.id == routineID).OrderByDescending(log => log.timeLogged).ToList();
        }
    }

    public List<SetAttributes> getSetAttributes(Int64 logID)
    {
        using (var context = new Layer2Container())
        {
            return context.SetAttributes.Where(sets => sets.LoggedExercise.id == logID).ToList();
        }
    }

    public String setsToString(List<SetAttributes> sets)
    {
        int i = 1;
        String rc = "";
        foreach (var set in sets)
        {
            rc += "<br/><strong>Set " + i + "</strong><br /> ";
            if (set.weight > 0)
            {
                rc += "Weight: " + set.weight + "kg | ";
            }
            if (set.reps > 0)
            {
                rc += "Reps: " + set.reps + " | ";
            }
            if (set.distance > 0)
            {
                rc += "Distance: " + set.distance + "km | ";
            }
            if (set.time > 0)
            {
                int minutes = (Int32)set.time / 60;
                int seconds = (Int32)set.time - minutes * 60;
                rc += "time: " + minutes + "m " + seconds + "s | ";
            }
            i++;
            rc += "<br />";
            if (set.note != null)
            {
                if (!set.note.Equals(""))
                {
                    rc += "Note: " + set.note + "<br />";
                }
            }
        }
        return rc;
    }

    public List<SetAttributes> getSetAttributesFromLoggedExerciseFromUser(string userName, string exerciseName)
    {
        using (var context = new Layer2Container())
        {
            return context.LoggedExercises.Where(s => s.Exercise.name == exerciseName && s.LimitBreaker.username == userName).FirstOrDefault().SetAttributes.ToList();
        }
    }
}