public with sharing class Address {
   
    public Integer doorNo {
        get;
        set;
    }
    public String street {
        get;
        set;
    }
    public String city {
        get;
        set;
    }
    public String state {
        get;
        set;
    }
    public String postalCode {
        get;
        set;
    }
   
   
    public Address() {

    }
    public Address(Integer doorNo, String street, String city, String state, String postalCode) {
        this.doorNo = doorNo;
        this.street = street;
        this.city = city;
        this.state = state;
        this.postalCode = postalCode;
    }
}