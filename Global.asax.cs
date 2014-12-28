using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using MyWebStore;

namespace MyWebStore
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterOpenAuth();

            //Add Administrator
            if (!Roles.RoleExists("Administrator"))
            {
                Roles.CreateRole("Administrator");
            }
            if (Membership.GetUser("Admin") == null)
            {
                Membership.CreateUser("Admin", "Pa$$word", "foo@nyp.edu.sg");
                Roles.AddUserToRole("Admin", "Administrator");
            }
        }

        void Application_End(object sender, EventArgs e)
        {
            //  Code that runs on application shutdown

        }

        void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an unhandled error occurs

        }
    }
}
