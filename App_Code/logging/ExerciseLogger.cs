using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Concrete logger for exercises
/// </summary>
public class ExerciseLogger : AbstractLogger, LogStrategy
{
	public ExerciseLogger() : base()
	{
	}

    //Get a logged exercise that has been logged within the hour and with the same exercise, else create a new one
    public int logExercise(Int32 userID, Int32 exerciseID, Int32 reps, Int32 time, Int32 weight, Double distance, string note=null, Int32 routineID = 0)
    {
        using (var context = new Layer2Container())
        {
            LoggedExercise log = logExists(exerciseID, userID);
            SetAttributes set;
            if (log != null)
            {
                set = createSet(reps, time, weight, distance, log.id);

            }
            else
            {
                log = createLoggedExercise(userID, exerciseID);
                set = createSet(reps, time, weight, distance, log.id);
            }

            int exp = 0;

            if (set != null)
            {
                string exerciseName = context.Exercises.Where(s => s.id == exerciseID).FirstOrDefault().name;
                exp = expMngr.calculateLoggedExerciseExperience(exerciseName, set);
            }

            return exp;
        }
    }

    //Find if a log has existed within the last hour
    public LoggedExercise logExists(Int32 exerciseID, Int32 userID, Int32 routineID = 0)
    {
        using (var context = new Layer2Container())
        {
            List<LoggedExercise> logs = (from loggedExercise in context.LoggedExercises
                                         where loggedExercise.Exercise.id == exerciseID && loggedExercise.LimitBreaker.id == userID
                                         select loggedExercise).ToList();
            if (logs != null)
            {
                foreach (LoggedExercise log in logs)
                {
                    TimeSpan difference = DateTime.Now - log.timeLogged;
                    if (difference.TotalHours < 1)
                    {
                        return log;
                    }
                }
            }
            return null;
        }
    }

    //Create a logged exercise entry for usage in sets
    public LoggedExercise createLoggedExercise(Int32 userID, Int32 exerciseID, Int32 routineID = 0)
    {

        using (var context = new Layer2Container())
        {
            Exercise exercise = context.Exercises.Where(e => e.id == exerciseID).FirstOrDefault();
            LimitBreaker limitBreaker = context.LimitBreakers.Where(l => l.id == userID).FirstOrDefault();
            if (exercise != null && limitBreaker != null)
            {
                LoggedExercise log;
                log = new LoggedExercise();
                log.timeLogged = DateTime.Now;
                log.Exercise = exercise;
                log.LimitBreaker = limitBreaker;
                context.LoggedExercises.AddObject(log);
                context.SaveChanges();
                return log;
            }
            else
            {
                return null;
            }
        }
    }

    //Creation of an actual logged exercise set
    public SetAttributes createSet(Int32 rep, Int32 time, Int32 weight, Double distance, Int64 logID, string note = null)
    {

        using (var context = new Layer2Container())
        {
            LoggedExercise existingLog = context.LoggedExercises.Where(log => log.id == logID).FirstOrDefault();
            if (existingLog != null)
            {
                SetAttributes set;
                set = new SetAttributes();
                set.reps = rep;
                set.time = time;
                set.weight = weight;
                set.distance = distance;
                set.timeLogged = DateTime.Now;
                set.LoggedExercise = existingLog;
                context.SetAttributes.AddObject(set);
                context.SaveChanges();
                return set;
            }
            else
            {
                return null;
            }
        }
    }
}