using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(XDPMMNM_sach.Startup))]
namespace XDPMMNM_sach
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
