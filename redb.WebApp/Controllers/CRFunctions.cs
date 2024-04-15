using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using redb.Core;

namespace redb.WebApp.Controllers
{
    [Microsoft.AspNetCore.Mvc.Route(template: "Cnt/[controller]")]
    [Microsoft.AspNetCore.Mvc.ApiController]
    [Authorize]
    public class CRFunctions(IRedbService redbService) : Microsoft.AspNetCore.Mvc.ControllerBase
    {
        [Microsoft.AspNetCore.Mvc.HttpGet("[action]")]
        public IActionResult Details(string sn, string fn) => new ContentResult()
        {
            Content = redbService.Get_RFunctions()
                      .Where(f => f.IdSchemeNavigation.Name == sn && f.Name == fn)
                      .Select(o => o.Body).Single(),
            ContentType = "application/javascript",
            StatusCode = 200
        };
    
    }
}
