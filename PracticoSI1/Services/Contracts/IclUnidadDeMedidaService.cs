using PracticoSI1.Models;

namespace PracticoSI1.Services.Contracts
{
    public interface IclUnidadDeMedidaService
    {
        Task<List<clUnidadDeMedida>> GetList();
        Task<clUnidadDeMedida> AgregaActualiza(clUnidadDeMedida l, string t);
        Task<int> Elimina(clUnidadDeMedida l);
    }
}
