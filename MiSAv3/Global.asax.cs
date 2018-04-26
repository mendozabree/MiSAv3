using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Data.Entity;
using System.Web.Security;
using System.Web.SessionState;
using MiSAv3.Roles;

namespace MiSAv3
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Create the administrator role and user.
            RoleAction roleActions = new RoleAction();
            roleActions.createAdmin();
        }
    }
}