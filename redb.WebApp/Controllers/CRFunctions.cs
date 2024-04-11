using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using redb.Core;

namespace redb.WebApp.Controllers
{
    [Route(template: "Cnt/[controller]")]
    [ApiController]
    [Authorize]
    public class CRFunctions(IRedbService redbService) : ControllerBase
    {
        [HttpGet("[action]")]
        public Task<string> Details(string sn, string fn) => redbService.Get_RFunctions().
            Where(f => f.IdSchemeNavigation.Name == sn && f.Name == fn)
            .Select(o => o.Body).SingleAsync();
    }
}
