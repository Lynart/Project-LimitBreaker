using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Contains an interface for logging exercises
/// </summary>
interface LogStrategy
{
    int logExercise(Int32 userID, Int32 exerciseID, Int32 reps, Int32 time, Int32 weight, Double distance, string note=null, Int32 routineID=0);
    LoggedExercise logExists(Int32 exerciseID, Int32 userID, Int32 routineID=0);
    LoggedExercise createLoggedExercise(Int32 userID, Int32 exerciseID, Int32 routineID=0);
    SetAttributes createSet(Int32 rep, Int32 time, Int32 weight, Double distance, Int64 logID, string note=null);
}