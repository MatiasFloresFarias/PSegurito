package cl.awake.psegurito;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cl.awake.psegurito.model.ActividadMejoraPorMesC;
import cl.awake.psegurito.services.ActividadMejoraPorMesCService;

/**
 * Controlador Actividad Mejora Por Mes
 * 
 * @author Desarrolladores PSegurito
 */

@Controller
public class ActividadMejoraPorMesCController {

    @Autowired
    ActividadMejoraPorMesCService apms;

    /**
     * Muestra el listado de actividades de mejora por mes y cada nueva actividad es
     * agregada
     * 
     * 
     * @return un objeto {@link ModelAndView} con la respuesta a la solicitud,
     *         Mostrar actividad mejora por mes
     * 
     * @see List
     * @see put
     * @see map
     */

    @RequestMapping("/actividadpormesc")
    public ModelAndView entregaractividadmejorapormesc() {
        List<ActividadMejoraPorMesC> lista = apms.getActividadMejoraPorMesC();
        String[] nombre = new String[lista.size()];
        int[] actividadmejora = new int[lista.size()];
        for (int i = 0; i < lista.size(); i++) {
            nombre[i] = lista.get(i).getNombre();
            actividadmejora[i] = lista.get(i).getActividadmejora();
        }
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("lista", lista);
        model.put("empresas", new JSONArray(nombre));
        model.put("actividadmejora", new JSONArray(actividadmejora));
        return new ModelAndView("VistaActividadMejoraPorMesC", "model", model);
    }

}
