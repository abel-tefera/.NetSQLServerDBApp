using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Musikas.Startup))]
namespace Musikas
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            //ConfigureAuth(app);
        }
    }
}
