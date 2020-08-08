package cl.awake.psegurito.model;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public interface UsuarioRepository extends CrudRepository<Usuario, UsuarioId>{

    //@Query(value="SELECT CASE WHEN COUNT(u)> 0 THEN TRUE ELSE FALSE END FROM usuario u WHERE u.nickname= :nickname", nativeQuery=true)
	Long countByNickname(@Param("nickname") String nickname);
	@Query(value="Select * from usuario u where u.nickname=?1", nativeQuery=true)
	Usuario getByNickname(String nickname);
	@Transactional
	@Modifying
	@Query(value="Update usuario u set  u.password= :password, u.rol= :rol where u.id_usuario= :id_usuario and u.nickname= :nickname", nativeQuery=true)
	 void updateUserByIdAndNickname(
			 @Param("nickname") String nickname,
			 @Param("password")String password,
			 @Param("rol") String rol,
	 		 @Param("id_usuario") int id_usuario);
}
