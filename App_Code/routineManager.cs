using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for routineManager
/// </summary>
public class routineManager
{
    public routineManager()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    // Return a list of routines
    public ICollection<String> viewRoutines()
    {
        using (var context = new Layer2Container())
        {
            ICollection<String> rc = context.Routines.Select(x => x.name).ToList();

            return rc;
        }
    }

    // Still missing stuff like: exercise goals, logged exercises, and scheduled routines
    // Also need to have a test user to actually test this on
    // exercise goals would be the exercise set to be in the routine
    public Routine createNewRoutine(String routineName, int userID)
    {
        using (var context = new Layer2Container())
        {
            Routine rc = new Routine();
            try
            {
                LimitBreaker lb = context.LimitBreakers.Where(x => x.id == userID).FirstOrDefault();

                if (lb != null)
                {
                    rc.name = routineName.Trim();
                    rc.LimitBreaker = lb;
                    rc.last_modified = new DateTime();
                }
            }
            catch (NullReferenceException e)
            {


            }

            return rc;
        }
    }
}