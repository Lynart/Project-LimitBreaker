using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

/// <summary>
/// Basic abstraction for user, containing only constructor logic
/// </summary>
public abstract class AbstractUser
{
    protected LimitBreaker limitBreaker;
    protected MembershipUser membershipUser;

	public AbstractUser()
    {
        limitBreaker = null;
        membershipUser = null;
    }

    public LimitBreaker getLimitBreaker()
    {
        return limitBreaker;
    }

    public MembershipUser getMembershipUser()
    {
        return membershipUser;
    }
}