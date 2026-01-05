public with sharing class ContactController {

   

    @AuraEnabled(cacheable=true)

    public static List<Contact> getContacts() {

        return [SELECT Id, Name, Email FROM Contact];

    }

   

    @AuraEnabled

    public static Contact addNewContact(String name, String email) {

        Contact newContact = new Contact(LastName=name,Email=email);

        insert newContact;

        return newContact;

    }

}