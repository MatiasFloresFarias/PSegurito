package cl.awake.psegurito;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cl.awake.psegurito.model.Usuario;
import cl.awake.psegurito.model.UsuarioId;
import cl.awake.psegurito.services.UsuarioService;

/**
 * Controlador Usuario
 * 
 * @author Desarrolladores PSegurito
 */
@Controller
public class UsuarioController {

    @Autowired
    UsuarioService us;

    /**
     * Muestra el listado de usuarios según los permisos del {@link Administrador}
     * autenticado
     * 
     * @param us injeccion de UsuarioService
     *
     * @see List
     */

    @RequestMapping("/listarUsuario")
    public ModelAndView listarUsuario() {
        List<Usuario> lista = us.getAll();
        return new ModelAndView("listaUsuario", "lista", lista);
    }

    /**
     * 
     * 
     * @param id identificador numerico de {@link Usuario}
     * 
     * @param u  listado de usuarios
     * 
     * @see List
     * @see put
     * @see map
     */

    @RequestMapping("/editarUsuario/{id}/{nickname}/{message}")
    public ModelAndView editarUsuario(@PathVariable int id, @PathVariable String nickname,
            @PathVariable String message) {
        UsuarioId uid = new UsuarioId(id, nickname);
        Usuario u = us.getById(uid);
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("u", u);
        model.put("message", message);
        return new ModelAndView("cambiaClave", "model", model);
    }

    @RequestMapping(value = "/guardarEditUsuario", method = RequestMethod.POST)
    public ModelAndView guardarEditUsuario(Usuario u, @RequestParam String oldPassword,
            RedirectAttributes redirectAttrs) {

        /**
         * Validacion password
         */

        // validar password viejo
        Usuario u1 = new Usuario();
        u1 = us.getByNickname(u.getNickname());
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        if (passwordEncoder.matches(oldPassword, u1.getPassword())) {
            // encriptando nueva password
            String password = u.getPassword();
            u.setPassword(passwordEncoder.encode(password));
            // editando la bbdd
            us.edit(u);
            return new ModelAndView("redirect:/listarUsuario");
        } else {
            String mensaje = "la password ingresada es erronea";
            redirectAttrs.addAttribute("id", u.getId_usuario());
            redirectAttrs.addAttribute("nickname", u.getNickname());
            redirectAttrs.addAttribute("message", mensaje);
            return new ModelAndView("redirect:/editarUsuario/{id}/{nickname}/{message}.do");
        }

    }
}
