package com.hostel_manage.models;


import jakarta.persistence.*;
import org.antlr.v4.runtime.misc.NotNull;

@Entity
@Table(
        name = "security",
        uniqueConstraints = {
                @UniqueConstraint(name = "unique_email", columnNames = "Email"),
                @UniqueConstraint(name = "unique_nic", columnNames = "nic")
        }
)
public class Security {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "security_id")
    private int securityId;

    @Column(name = "first_Name")
    private String firstName;

    @Column(name = "last_Name")
    private String lastName;

    @Column(name = "Email")
    private String email;

    @Column(name = "nic")
    private String nic;

    @Column(name = "address")
    private String address;

    @Column(name = "personal_no")
    private int personalNo;

    @Column(name = "office_no")
    private Integer officeNo; // Use Integer for nullable fields

    // Constructors, getters, and setters


    public int getSecurityId() {
        return securityId;
    }

    public void setSecurityId(int securityId) {
        this.securityId = securityId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public int getPersonalNo() {
        return personalNo;
    }

    public void setPersonalNo(int personalNo) {
        this.personalNo = personalNo;
    }

    public Integer getOfficeNo() {
        return officeNo;
    }

    public void setOfficeNo(Integer officeNo) {
        this.officeNo = officeNo;
    }
}
