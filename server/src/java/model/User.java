
package model;
import java.util.Date;
 

 
public class User {
   String emp_ID, name, surname,phone,date;
   Date hired;

    

    public String getPhone() {
        return phone;
    }

    //put getter and setter here
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmp_ID() {
        return emp_ID;
    }

    public void setEmp_ID(String emp_ID) {
        this.emp_ID = emp_ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Date getHired() {
        return hired;
    }

    public void setHired(Date hired) {
        this.hired = hired;
    }
    
     public void setDate(String date) {
        this.date=date;
    }
      public String getDate() {
        return date;
    }
}
