using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(PMOWebsite.Startup))]
namespace PMOWebsite
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
