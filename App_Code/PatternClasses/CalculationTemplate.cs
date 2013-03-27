using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Used to simplifiy calculatons involving weight by adding the conversion functions here
/// </summary>
public abstract class CalculationTemplate
{
	public CalculationTemplate()
	{
	}

    public Double metricCalculate(Double weight, Double height)
    {
        return calculate(weight, height);
    }

    public Double imperialCalculate(Double weight, Double foot, Double inch)
    {
        return calculate(weight, foot * 30.48 + inch * 2.54);
    }

    public abstract Double calculate(Double weight, Double height);
}