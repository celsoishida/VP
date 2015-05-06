using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(VP.Startup))]
namespace VP
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
