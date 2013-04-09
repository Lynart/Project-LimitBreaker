using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RoutineLogger
/// </summary>
public class RoutineLogger : AbstractLogger, LogStrategy 
{
	public RoutineLogger() : base()
	{

	}
    public int logExercise(Int32 userID, Int32 exerciseID, Int32 reps, Int32 time, Int32 weight, Double distance, string note=null, Int32 routineID = 0)
    {       //changed the return type to return the amount of exp rewarded
        //Get a logged exercise that has been logged within the hour and with the same exercise, else create a new one
        using (var context = new Layer2Container())
        {
            LoggedExercise log = logExists(exerciseID, userID, routineID=0);
            SetAttributes set;
            if (log != null)
            {
                set = createSet(reps, time, weight, distance, log.id, note);
            }
            else
            {
                log = createLoggedExercise(userID, exerciseID, routineID);
                set = createSet(reps, time, weight, distance, log.id, note);
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

    public LoggedExercise logExists(Int32 exerciseID, Int32 userID, Int32 routineID=0)
    {
        using (var context = new Layer2Container())
        {
            List<LoggedExercise> logs = (from loggedExercise in context.LoggedExercises
                                         where loggedExercise.LimitBreaker.id == userID
                                         where loggedExercise.Routine.id == routineID
                                         where loggedExercise.Exercise.id == exerciseID
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

    public LoggedExercise createLoggedExercise(Int32 userID, Int32 exerciseID, Int32 routineID=0)
    {

        using (var context = new Layer2Container())
        {
            Exercise exercise = context.Exercises.Where(e => e.id == exerciseID).FirstOrDefault();
            LimitBreaker limitBreaker = context.LimitBreakers.Where(l => l.id == userID).FirstOrDefault();
            Routine routine = context.Routines.Where(r => r.id == routineID).FirstOrDefault();

            if (exercise != null && limitBreaker != null && routine != null)
            {
                LoggedExercise log;
                log = new LoggedExercise();
                log.timeLogged = DateTime.Now;
                log.Exercise = exercise;
                log.LimitBreaker = limitBreaker;
                log.Routine = routine;
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

    public SetAttributes createSet(Int32 rep, Int32 time, Int32 weight, Double distance, Int64 logID, string note=null)
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
                set.note = note.Trim();
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

    public List<LoggedExercise> getLoggedExercises(Int32 userID, Int32 routineID)
    {
        using (var context = new Layer2Container())
        {
            return context.LoggedExercises.Where(log => log.LimitBreaker.id == userID && log.Routine.id == routineID).OrderByDescending(log => log.timeLogged).ToList();
        }
    }
}