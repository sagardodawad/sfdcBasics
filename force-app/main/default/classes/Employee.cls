public with sharing class Employee extends Person {
   public Integer empId{get; set;}
   public String designation{get; set;}

   public Employee(){
    super();
   }
   public Employee(String name, String email, Integer phone, Address address, Integer empId, String designation){
       super(name, email, phone, address);
       this.empId = empId;
       this.designation = designation;
   }
}