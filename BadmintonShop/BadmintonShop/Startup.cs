using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BadmintonShop.Startup))]
namespace BadmintonShop
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
