using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;

/// <summary>
/// Summary description for Layer2Manager
/// </summary>
public class Layer2Manager
{
    System.Web.HttpApplication _context;
	
    public Layer2Manager()
	{
        _context = System.Web.HttpContext.Current.ApplicationInstance;
	}

    public List<ExerciseBase> getAllExercises()
    {
        using (var context = new Layer2Container())
        {
            return context.ExerciseBases.OrderBy(o => o.id).ToList();
        }
    }

}