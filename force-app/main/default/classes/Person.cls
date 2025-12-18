public virtual with sharing class Person {
    public String name{
        get;
        set;}
    public String email{
        get;
        set;}
    public Integer phone{
        get;
        set;}
    public Address address{
        get;
        set;}

    public Person(){}

    public Person(String name, String email, Integer phone, Address address){
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }
    public String greetUser(String name){
        return 'Hello ' + name + '!';
    }
    
}