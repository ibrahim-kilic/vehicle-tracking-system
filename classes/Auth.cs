using System;
using System.Web;
using System.Web.UI;

namespace ATS.Classes
{

    public enum Role { Cirak = 0, Kalfa = 1, Usta = 2, Admin = 3 }

    public static class Auth
    {
        public const string SessionKey = "Statu";
        public static Role? CurrentRole
        {
            get
            {
                var v = HttpContext.Current?.Session?[SessionKey];
                if (v == null) return null;
                return ParseRole(v.ToString());
            }
        }


        public static Role ParseRole(string s)
        {
            if (string.IsNullOrWhiteSpace(s)) return Role.Cirak;
            s = s.Trim().ToLowerInvariant();
            switch (s)
            {
                case "admin": return Role.Admin;
                case "usta":
                case "master": return Role.Usta;
                case "kalfa":
                case "journeyman": return Role.Kalfa;
                case "cirak":
                case "çırak":
                case "apprentice": return Role.Cirak;
                default: return Role.Cirak;
            }
        }

        public static bool IsLoggedIn => CurrentRole.HasValue;

        public static bool HasMinRole(Role required)
        {
            var cur = CurrentRole;
            return cur.HasValue && (int)cur.Value >= (int)required;
        }

        public static bool HasAnyRole(params Role[] roles)
        {
            var cur = CurrentRole;
            if (!cur.HasValue) return false;
            foreach (var r in roles) if (cur.Value == r) return true;
            return false;
        }

        public static void RequireMinRole(Page page, Role required)
        {
            if (!HasMinRole(required))
            {
                page.Response.Redirect("login.aspx?denied=1");
                page.Response.End();
            }
        }
    }
}
