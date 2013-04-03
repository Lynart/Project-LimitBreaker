using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

/// <summary>
/// Summary description for ProfileUser
/// </summary>
public class ProfileUser : AbstractUser
{
	public ProfileUser(String username)
	{
        using (var context = new Layer2Container())
        {
            limitBreaker = context.LimitBreakers.Where(breaker => breaker.username == username).FirstOrDefault();
        }
        membershipUser = Membership.GetUser(username);
	}
}