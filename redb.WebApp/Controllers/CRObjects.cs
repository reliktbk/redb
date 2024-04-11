using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using redb.Core;
using redb.WebApp.DataModels;

namespace redb.WebApp.Controllers
{
    [Route(template: "Cnt/[controller]")]
    [ApiController]
    [Authorize]
    public class CRObjects(IRedbService redbService) : ControllerBase
    {
        [HttpGet("[action]")]
        public Task<List<ObjectView>> GetAllObjects() => redbService.Get_AllRObjects().
            Select(o => new ObjectView
            {
                Id = o.Id.ToString(),
                ParentId = o.IdParent.ToString(),
                Name = o.Name
            }).ToListAsync();

        [HttpGet("[action]")]
        public Task<ObjectItemView> Details(long id) => redbService.
            Get_RObjectById(id).
            Select(o=> (ObjectItemView)o).            
            SingleAsync();
    }
}
