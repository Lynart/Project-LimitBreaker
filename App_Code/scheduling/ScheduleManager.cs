﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Diagnostics;
using System.IO;
using System.Threading;

/// <summary>
/// The schedulemanager contains methods which allow to retreive information associated with scheduled items in the database
/// </summary>
public class ScheduleManager
{
    public ScheduleManager()
    {

    }

    /// <summary>
    /// Gets all the routines in the database
    /// </summary>
    /// <returns></returns>
    public List<ScheduledRoutine> getRoutines()
    {
        using (var context = new Layer2Container())
        {
            return context.ScheduledRoutines.OrderBy(o => o.startTime).ToList();
        }
    }

    public ICollection<ScheduledExercise> getScheduledExercises(int userID, DateTime day)
    {
        using (var context = new Layer2Container())
        {
            ICollection<ScheduledExercise> rc = context.ScheduledExercises.ToList();
            rc = rc.Where(x => x.LimitBreakers.id == userID).ToList();

            var exercises = from e in context.ScheduledExercises
                            orderby e.startTime
                            where (e.LimitBreakers.id == userID && e.startTime.Day == day.Day)
                            select new scheduledItem
                            {
                                itemName = "[E] " + e.Exercise.name,
                                startTime = e.startTime,
                                user = e.LimitBreakers,
                                id = e.id,
                                description = e.Exercise.description,
                                isExericse = true
                            };
            return rc;
        }
    }

    /// <summary>
    /// Removes a scheduled from the users schedule
    /// </summary>
    /// <param name="itemID">The scheduled item ID</param>
    /// <param name="isExercise">If its an exercise or a routine</param>
    /// <param name="userID">The id of the currently logged in user</param>
    /// <returns>Returns true if deleted the scheduled Item</returns>
    public bool deleteScheduledItem(Int32 itemID, bool isExercise, Int32 userID)
    {
        bool result = false;
        using (var context = new Layer2Container())
        {
            //Routine rc = new Routine();
            try
            {
                if (isExercise)
                {
                    ScheduledExercise rc = context.ScheduledExercises.Where(e => e.id == itemID).FirstOrDefault();
                    if (rc != null)
                    {
                        context.ScheduledExercises.DeleteObject(rc);
                        context.SaveChanges();
                        result = true;
                    }
                    else
                    {
                        result = false;
                    }
                }
                else
                {
                    ScheduledRoutine rc = context.ScheduledRoutines.Where(e => e.id == itemID).FirstOrDefault();
                    if (rc != null)
                    {
                        context.ScheduledRoutines.DeleteObject(rc);
                        context.SaveChanges();
                        result = true;

                    }
                    else
                    {
                        result = false;
                    }
                }
            }
            catch (NullReferenceException e)
            {
                //Console.WriteLine(e.Message + Environment.NewLine + e.StackTrace);
                //// write off the execeptions to my error.log file
                //StreamWriter wrtr = new StreamWriter(System.Web.HttpContext.Current.ApplicationInstance.Server.MapPath("~/assets/documents/" + @"\" + "error.log"), true);

                //wrtr.WriteLine(DateTime.Now.ToString() + " | Error: " + e);

                //wrtr.Close();
            }

        }

        return result;
    }

    /// <summary>
    /// Modify a scheduled item for a user
    /// </summary>
    /// <param name="id">The id of the scheduled item</param>
    /// <param name="newItemID">The id of the new exercise or routine</param>
    /// <param name="isExercise">If its a routine or exercise</param>
    /// <param name="date">The new date to schedule for</param>
    /// <returns>True if modified succesfully</returns>
    public bool modifyScheduledItem(Int32 id, Int32 newItemID, bool isExercise, DateTime date)
    {
        bool result = false;
        using (var context = new Layer2Container())
        {
            try
            {
                if (isExercise)
                {
                    ScheduledExercise rc = context.ScheduledExercises.Where(e => e.id == id).FirstOrDefault();
                    if (rc != null)
                    {
                        rc.Exercise = context.Exercises.Where(e => e.id == newItemID).FirstOrDefault();
                        rc.startTime = date;
                        context.ScheduledExercises.ApplyCurrentValues(rc);
                        context.SaveChanges();
                        result = true;
                    }
                    else
                    {
                        result = false;
                    }
                }
                else
                {
                    ScheduledRoutine rc = context.ScheduledRoutines.Where(e => e.id == id).FirstOrDefault();
                    if (rc != null)
                    {
                        rc.Routine = context.Routines.Where(e => e.id == newItemID).FirstOrDefault();
                        rc.startTime = date;
                        context.ScheduledRoutines.ApplyCurrentValues(rc);
                        context.SaveChanges();
                        result = true;

                    }
                    else
                    {
                        result = false;
                    }
                }
            }
            catch (NullReferenceException e)
            {
                Console.WriteLine(e.Message + Environment.NewLine + e.StackTrace);
            }
        }
        return result;
    }

    /// <summary>
    /// Gets the scheduled item based on the id
    /// </summary>
    /// <param name="id">the id of the exercise or routine</param>
    /// <param name="isExercise">if its a routine or exercise</param>
    /// <returns>returns a scheduled item based on the routine</returns>
    public scheduledItem getScheduledItemByID(int id, bool isExercise)
    {
        using (var context = new Layer2Container())
        {
            try
            {
                if (isExercise)
                {

                    var exercise = from e in context.ScheduledExercises
                                   where (e.id == id)
                                   select new scheduledItem
                                   {
                                       itemName = "[E] " + e.Exercise.name,
                                       startTime = e.startTime,
                                       user = e.LimitBreakers,
                                       id = e.id,
                                       description = e.Exercise.description,
                                       isExericse = true
                                   };
                    return exercise.FirstOrDefault();
                }
                else
                {
                    var routine = from r in context.ScheduledRoutines
                                  where (r.id == id)
                                  select new scheduledItem
                                  {
                                      itemName = "[R] " + r.Routine.name,
                                      startTime = r.startTime,
                                      user = r.LimitBreaker,
                                      id = r.id,
                                      description = "",
                                      isExericse = false
                                  };
                    return routine.FirstOrDefault();

                }
            }
            catch (Exception e)
            {
                //Console.WriteLine(e.Message + Environment.NewLine + e.StackTrace);
                //// write off the execeptions to my error.log file
                //StreamWriter wrtr = new StreamWriter(System.Web.HttpContext.Current.ApplicationInstance.Server.MapPath("~/assets/documents/" + @"\" + "error.log"), true);

                //wrtr.WriteLine(DateTime.Now.ToString() + " | Error: " + e);

                //wrtr.Close();
                return null;

            }
        }


    }

    public bool deleteListOfScheduledItems(List<scheduledItem> items, Int32 userID)
    {
        bool result = false;
        using (var context = new Layer2Container())
        {
            //Routine rc = new Routine();
            try
            {
                foreach (var item in items)
                {
                    if (item.isExericse)
                    {

                        ScheduledExercise rc = context.ScheduledExercises.Where(e => e.id == item.id).FirstOrDefault();
                        if (rc != null)
                        {
                            context.ScheduledExercises.DeleteObject(rc);
                            context.SaveChanges();
                            result = true;
                        }
                        else
                        {
                            result = false;
                        }
                    }

                    else
                    {
                        ScheduledRoutine rc = context.ScheduledRoutines.Where(e => e.id == item.id).FirstOrDefault();
                        if (rc != null)
                        {
                            context.ScheduledRoutines.DeleteObject(rc);
                            context.SaveChanges();
                            result = true;

                        }
                        else
                        {
                            result = false;
                        }
                    }
                }
            }
            catch (NullReferenceException e)
            {
                //Console.WriteLine(e.Message + Environment.NewLine + e.StackTrace);
                //// write off the execeptions to my error.log file
                //StreamWriter wrtr = new StreamWriter(System.Web.HttpContext.Current.ApplicationInstance.Server.MapPath("~/assets/documents/" + @"\" + "error.log"), true);

                //wrtr.WriteLine(DateTime.Now.ToString() + " | Error: " + e);

                //wrtr.Close();
            }

        }

        return result;
    }
}