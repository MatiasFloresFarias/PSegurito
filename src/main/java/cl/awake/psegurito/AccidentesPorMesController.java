package cl.awake.psegurito;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cl.awake.psegurito.model.AccidentesPorMes;
import cl.awake.psegurito.services.AccidentesPorMesService;

/**
 * Controlador Accidentes Por Mes
 * 
 * @author Desarrolladores PSegurito
 */

@Controller
public class AccidentesPorMesController {
    @Autowired
    AccidentesPorMesService apm;

    /**
     * Muestra el listado de accidentes por mes y cada nuevo accidente es agregado
     * 
     * 
     * @return un objeto {@link ModelAndView} con la respuesta a la solicitud,
     *         Mostrar accidentes por mes
     * 
     * @see List
     * @see put
     * @see map
     */

    @RequestMapping("/accidentespormes")
    public ModelAndView entregaraccidentespormes() {
        List<AccidentesPorMes> lista = apm.getAccidentesPorMes();
        String[] nombre = new String[lista.size()];
        int[] accidente = new int[lista.size()];
        for (int i = 0; i < lista.size(); i++) {
            nombre[i] = lista.get(i).getNombre();
            accidente[i] = lista.get(i).getAccidentes();
        }
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("lista", lista);
        model.put("empresas", new JSONArray(nombre));
        model.put("accidentes", new JSONArray(accidente));
        return new ModelAndView("VistaAccidentesPorMes", "model", model);

    }

}
