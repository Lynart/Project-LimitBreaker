using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

/// <summary>
/// Intended to be used when creating a new user
/// </summary>
public class NewUser : AbstractUser
{
    String message;

    public NewUser(String username, String email, String password, String gender, DateTime birthday, Double weight, Double height)
    {
        using (var context = new Layer2Container())
        {
            //If username already exists, fail
            if (context.LimitBreakers.FirstOrDefault(limitbreaker => limitbreaker.username == username)==null)
            {
                Console.Write("shouldn't be entering here");
                limitBreaker = new LimitBreaker();

                limitBreaker.username = username;
                limitBreaker.gender = gender;
                limitBreaker.dateOfBirth = birthday;
                limitBreaker.email = email;
                limitBreaker.verified = false;
                limitBreaker.deactivated = false;

                //Create stats for LimitBreaker
                Statistics stats = new Statistics();
                stats.level = 1;
                stats.experience = 0;
                stats.weight = weight;
                stats.height = height;
                stats.rmr = FormulaProvider.calculateRMR(weight, height, DateTime.Now.Year-birthday.Year, gender); //Fix this
                stats.bmi = FormulaProvider.calculateBMI(weight, height); //Fix this
                stats.vo2MAX = 0; //Too lazy to implement

                //Reference to limitbreaker above
                stats.LimitBreaker = limitBreaker;

                //Attempt to add object into database
                try
                {
                    context.LimitBreakers.AddObject(limitBreaker);
                    context.Statistics.AddObject(stats);
                    context.SaveChanges();
                }

                //Database failure most likely
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);

                }

                //Create membershipUser
                System.Web.Security.MembershipCreateStatus status;
                membershipUser = System.Web.Security.Membership.CreateUser(username, password, email, "none", "none", false, out status);
                System.Web.Security.Roles.AddUserToRole(username, "user");
            }
            else
            {
                message = "Username exists.";
            }
        }
    }

    public String getMessage()
    {
        return message;
    }
}