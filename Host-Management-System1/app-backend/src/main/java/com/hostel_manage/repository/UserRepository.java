package com.hostel_manage.repository;

import com.hostel_manage.models.User;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends CrudRepository<User,Integer> {
    @Transactional
    @Modifying
    @Query(value = "INSERT INTO users(`first_name`,`last_name`,`email`,`password`) VALUES(:first_name,:last_name,:email,:password)",nativeQuery = true)
    int registerNewUser(@Param("first_name") String first_name,
                        @Param("last_name") String last_name,
                        @Param("email") String email,
                        @Param("password") String password);
}
