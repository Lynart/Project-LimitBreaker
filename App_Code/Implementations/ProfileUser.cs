using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

/// <summary>
/// Used to display, return update stats
/// </summary>
public class ProfileUser : AbstractUser
{
    Statistics stats;
    int age;
    public ProfileUser(String username)
    {
        using (var context = new Layer2Container())
        {
            limitBreaker = context.LimitBreakers.Where(breaker => breaker.username == username).FirstOrDefault();
            //Because lazy loading is stupid
            stats = limitBreaker.Statistics;
        }
        membershipUser = Membership.GetUser(username);
        age = DateTime.Now.Year - limitBreaker.dateOfBirth.Year;
    }

    public string getUsername()
    {
        return limitBreaker.username;
    }

    public string getEmail()
    {
        return limitBreaker.email;
    }

    public double getWeight()
    {
        return stats.weight;
    }

    public double getHeight()
    {
        return stats.height;
    }

    public double getRMR()
    {
        return stats.rmr;
    }

    public double getBMI()
    {
        return stats.bmi;
    }

    public int getLvl()
    {
        return stats.level;
    }
    public double getExp()
    {
        return stats.experience;
    }

    public List<OldWeight> getOldWeights()
    {
        using (var context = new Layer2Container())
        {
            return context.OldWeights.Where(oldWeight => oldWeight.LimitBreaker.username == limitBreaker.username).OrderBy(oldWeight => oldWeight.date).ToList();
        }
    }

    public Boolean updateWeight(double weight)
    {
        using (var context = new Layer2Container())
        {
            //Refresh object
            limitBreaker = context.LimitBreakers.FirstOrDefault(breaker => breaker.username == limitBreaker.username);
            stats = limitBreaker.Statistics;
            context.LoadProperty(limitBreaker, "OldWeights");

            if (limitBreaker.OldWeights.Count > 0)
            {
                //Return false (do not update weight) if old weight exists and the update day was less than 24 hours
                if (DateTime.Now.Subtract(limitBreaker.OldWeights.LastOrDefault().date).Days < 1)
                {
                    return false;
                }
            }
            //Store the old weight
            OldWeight oldWeight = new OldWeight();
            oldWeight.LimitBreaker = limitBreaker;
            oldWeight.date = DateTime.Now;
            oldWeight.weight = stats.weight;
            context.OldWeights.AddObject(oldWeight);

            //Update new weight
            stats.weight = weight;

            //Save changes and recalculate rmr/bmi
            context.SaveChanges();
            update();
            return true;
        }
    }
    public void updateHeight(double height)
    {
        using (var context = new Layer2Container())
        {
            stats = context.LimitBreakers.FirstOrDefault(breaker => breaker.username == limitBreaker.username).Statistics;
            stats.height = height;
            context.SaveChanges();
            update();
        }
    }
    public void updateEmail(string email)
    {
        //Refresh context
        using (var context = new Layer2Container())
        {
            limitBreaker = context.LimitBreakers.FirstOrDefault(breaker => breaker.username == limitBreaker.username);
            limitBreaker.email = email;
            context.SaveChanges();
        }
        membershipUser.Email = email;
        Membership.UpdateUser(membershipUser);
    }

    //To avoid code redundency, uesd to update RMR and BMI
    private void update()
    {
        using (var context = new Layer2Container())
        {
            stats = context.LimitBreakers.FirstOrDefault(breaker => breaker.username == limitBreaker.username).Statistics;
            stats.bmi = FormulaProvider.calculateBMI(stats.weight, stats.height);
            stats.rmr = FormulaProvider.calculateRMR(stats.weight, stats.height, age, limitBreaker.gender);

            context.SaveChanges();
        }
    }

}