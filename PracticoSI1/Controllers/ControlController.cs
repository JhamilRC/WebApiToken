using Microsoft.AspNetCore.Mvc;
using PracticoSI1.Models;
using PracticoSI1.Services.Contracts;

namespace PracticoSI1.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ControlController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private readonly IUsuarioService _IUsuarioService;
        public ControlController (IConfiguration configuration, IUsuarioService usuarioService)
        {
            _IUsuarioService = usuarioService;
            _configuration = configuration;
        }
        [HttpPost("CrearToken")]
        public async Task <TokenModelo>PostToken(string login, string password)
        {
            TokenModelo token = new TokenModelo();
            try
            {
                var usuario = await _IUsuarioService.GetNombreUsuario(login);
                if (usuario != null)
                {
                    var hashedpassword = _IUsuarioService.CrearpasswordHash(password, usuario.Salt);
                    if (hashedpassword == usuario.Clave)
                    {
                        var currentDate = DateTime.UtcNow;
                        var expirationTime = TimeSpan.FromMinutes(10);
                        var expireDateTime = currentDate.Add(expirationTime);
                        var authSettings = _configuration.GetSection("AuthentificationSettings");
                        string issuer = authSettings["Issuer"];
                        string audience = authSettings["Audence"];
                        string signingkey = authSettings["Signingkey"];
                        token.token = _IUsuarioService.GenerarToken(currentDate, usuario, expirationTime, signingkey, audience, issuer);
                        token.tiempoExpira = expireDateTime;
                    }
                    else { }
                }
                else { }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error en la generacion del token:{ex.Message}");
            }
            return token;
        }
    }
}
