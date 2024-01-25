using PracticoSI1.Business.Contracts;
using PracticoSI1.Models;
using PracticoSI1.Services.Contracts;

namespace PracticoSI1.Services.Clases
{
    public class clUnidadDeMedidaService : IclUnidadDeMedidaService
    {
        private readonly IclUnidadDeMedidaRepository _IclUnidadDeMedidaRepository;
        public clUnidadDeMedidaService(IclUnidadDeMedidaRepository tempI)
        {
            _IclUnidadDeMedidaRepository = tempI;
        }
        public Task<List<clUnidadDeMedida>> GetList()
        {
            return _IclUnidadDeMedidaRepository.GetList();
        }
        public Task<clUnidadDeMedida> AgregaActualiza(clUnidadDeMedida l, string t)
        {
            return _IclUnidadDeMedidaRepository.AgregaActualiza(l, t);
        }
        public Task<int> Elimina(clUnidadDeMedida l)
        {
            return _IclUnidadDeMedidaRepository.Elimina(l);
        }
    }
}
