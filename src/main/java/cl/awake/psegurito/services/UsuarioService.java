package cl.awake.psegurito.services;

import java.util.List;

import cl.awake.psegurito.model.Usuario;
import cl.awake.psegurito.model.UsuarioId;

public interface UsuarioService {
	
//    Usuario getById(int id);
    Usuario getById(UsuarioId usuarioid);
    List<Usuario> getAll();   
    void add(Usuario u); 
    void edit(Usuario u);
    void delete(Usuario u);
//    void delete(int id);
    Usuario getByNickname(String nickname);
    void editUserByIdAndNickname(String nickname, String password, String rol, int id_usuario);
    Long countByNickname(String nickname);
}
