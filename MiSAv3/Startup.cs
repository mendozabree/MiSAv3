using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MiSAv3.Startup))]
namespace MiSAv3
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
