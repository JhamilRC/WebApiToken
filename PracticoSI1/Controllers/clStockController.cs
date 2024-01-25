using Microsoft.AspNetCore.Mvc;
using PracticoSI1.Models;
using PracticoSI1.Services.Contracts;

namespace PracticoSI1.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class clStockController :ControllerBase
    {
        private readonly IclStockService _IclStockService;
        public clStockController(IclStockService iTemp)
        {
            this._IclStockService = iTemp;
        }
        [HttpGet]
        public async Task<List<clStock>> GetList()
        {
            return await _IclStockService.GetList();
        }
        [HttpPost("AgregaActualiza")]
        public async Task<clStock> AgregaActualiza(clStock l, string t)
        {
            return await _IclStockService.AgregaActualiza(l, t);
        }
    }
}
