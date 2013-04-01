﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BMITemplate
/// </summary>
public class BMITemplate:CalculationTemplate
{
	public BMITemplate()
	{
	}
    Double calculate(Double weight, Double height, String gender)
    {
        return weight / (Math.Pow(height / 100, 2));
    }
}