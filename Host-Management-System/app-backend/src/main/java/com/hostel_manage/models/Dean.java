package com.hostel_manage.models;

import jakarta.persistence.*;

@Entity
@Table(
        name = "dean"
)
public class Dean {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int dean_id;
    private String first_Name;
    private String last_Name;

    private String Email;
    private String nic;
    private String address;
    private int personal_no;
    private int office_no;

    public int getDean_id() {
        return dean_id;
    }

    public void setDean_id(int dean_id) {
        this.dean_id = dean_id;
    }

    public String getFirst_Name() {
        return first_Name;
    }

    public void setFirst_Name(String first_Name) {
        this.first_Name = first_Name;
    }

    public String getLast_Name() {
        return last_Name;
    }

    public void setLast_Name(String last_Name) {
        this.last_Name = last_Name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPersonal_no() {
        return personal_no;
    }

    public void setPersonal_no(int personal_no) {
        this.personal_no = personal_no;
    }

    public int getOffice_no() {
        return office_no;
    }

    public void setOffice_no(int office_no) {
        this.office_no = office_no;
    }
}
