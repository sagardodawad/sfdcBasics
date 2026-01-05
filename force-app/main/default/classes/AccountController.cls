public with sharing class AccountController {
     @AuraEnabled(cacheable=true)
    public static List<Account> getAllAccounts(){
        return [SELECT Id,Name,Phone,AccountNumber FROM Account WITH SECURITY_ENFORCED];
    }
    @AuraEnabled
    public static boolean deleteAccount(Id accId){
        boolean deleteFlag=false;
        //Account accToDelete=[SELECT Id FROM Account WHERE Id=:accId WITH SECURITY_ENFORCED];
        Account accToDelete=new Account();
        accToDelete.Id=accId;
        try{
         delete accToDelete;
            deleteFlag=true;
        }catch(AuraHandledException e){
            throw new AuraHandledException(e.getMessage());
        }
        return deleteFlag;
    }
}