using System;
using System.Collections.Generic;
using System.Web;
using ATS.Classes;

namespace ATS
{
    public class Global : HttpApplication
    {

        private static readonly HashSet<string> PublicPages =
            new HashSet<string>(StringComparer.OrdinalIgnoreCase)
            {
                "~/login.aspx",
                "~/logout.aspx"
            };

        private static bool IsAllowed(string path, Role role)
        {
            string p = path.ToLowerInvariant();

            if (role == Role.Admin || role == Role.Usta)
                return true;

            if (role == Role.Kalfa)
                return p != "~/register.aspx";

            if (role == Role.Cirak)
                return p != "~/register.aspx" && p != "~/vehicleregister.aspx";

            return false;
        }

        protected void Application_AcquireRequestState(object sender, EventArgs e)
        {
            string path = VirtualPathUtility.ToAppRelative(Request.Path);

            if (!path.EndsWith(".aspx", StringComparison.OrdinalIgnoreCase))
                return;

            if (PublicPages.Contains(path))
                return;

            if (!Auth.IsLoggedIn)
            {
                Response.Redirect("~/login.aspx?denied=1", false);
                CompleteRequest();
                return;
            }

            var role = Auth.CurrentRole ?? Role.Cirak;
            if (!IsAllowed(path, role))
            {
                Response.Redirect("~/login.aspx?denied=1", false);
                CompleteRequest();
                return;
            }
        }
    }
}
