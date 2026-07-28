using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace JWTAuthenticationLab.Controllers
{
    [ApiController]

    [Route("api/[controller]")]

    [Authorize]

    public class SecureController : ControllerBase
    {
        [HttpGet]

        public IActionResult Get()
        {
            return Ok(
                "Welcome! JWT Authentication Successful.");
        }
    }
}