package com.hostel_manage.models;


import jakarta.persistence.*;

@Entity
@Table(name = "user")


//For procedure
//@NamedStoredProcedureQuery(
//        name = "checkLogin",
//        procedureName = "CheckLogin",
//        parameters = {
//                @StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "username"),
//                @StoredProcedureParameter(mode = ParameterMode.IN, type = String.class, name = "password")
//        }
//)

//define the store function for login check
@NamedQueries({
        @NamedQuery(
                name = "checkLogin",
                query = "SELECT CheckLogin(:username, :password) FROM Login "

        )
})
public class Login {
    @Id
    private String username;
    private String password;

    // Getters and setters

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}



