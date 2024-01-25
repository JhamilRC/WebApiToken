using PracticoSI1.Models;

namespace PracticoSI1.Services.Contracts
{
    public interface IUsuarioService
    {
        Task<Usuario> GetNombreUsuario(string nombreUsuario);
        string CrearpasswordHash(string password, string salt);
        string GenerarToken(DateTime currentDate, Usuario usuario, TimeSpan expirationTime, string? signingkey, string? audience, string? issuer);
    }
}
