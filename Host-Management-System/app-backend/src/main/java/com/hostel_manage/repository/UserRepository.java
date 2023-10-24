package com.hostel_manage.repository;

import com.hostel_manage.models.Login;
import com.hostel_manage.models.User;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
//public interface UserRepository extends CrudRepository<User,Integer>
public interface UserRepository extends JpaRepository<Login,String> {
    @Procedure(name = "checkLogin")
    Login findByUsername(String username);

    //Old code same time it is useful

//    @Query(value = "SELECT username FROM user WHERE username = :email ", nativeQuery = true)
//    List<String> checkUserEmail(@Param("email") String email);
//
//
//    @Query(value = "SELECT password FROM user WHERE username = :email", nativeQuery = true)
//    String checkUserPasswordByEmail(@Param("email") String email);
//
//    @Query(value = " SELECT * FROM user WHERE username = :email", nativeQuery = true)
//    User GetUserDetailsByEmail(@Param("email") String email);
//
//    @Query(value = "SELECT MD5(:passwd)",nativeQuery = true)
//    String getPasswordFromDB(@Param("passwd") String passwd);
//
//    @Transactional
//    @Modifying
//    @Query(value = "INSERT INTO users(`first_name`,`last_name`,`email`,`password`) VALUES(:first_name,:last_name,:email,:password)",nativeQuery = true)
//    int registerNewUser(@Param("first_name") String first_name,
//                        @Param("last_name") String last_name,
//                        @Param("email") String email,
//                        @Param("password") String password);
}
