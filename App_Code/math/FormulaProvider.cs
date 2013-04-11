using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// A class that provides static formulas methods
/// </summary>
public class FormulaProvider
{
	public FormulaProvider()
	{}

    static public double calculateRMR(double weight, double height, int age, string gender)
    {
        if (gender.Trim().ToLower().Equals("male"))
        {
            return weight * 10 + height * 6.25 - age * 6.76 + 66;
        }
        else
        {
            return weight * 9.56 + height * 1.85 - age * 4.68 + 655;
        }
    }

    static public double calculateBMI(double weight, double height)
    {
        return weight / Math.Pow(height / 100, 2);
    }
}