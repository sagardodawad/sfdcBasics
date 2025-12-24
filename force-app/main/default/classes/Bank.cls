public class Bank implements IBankServiceProvider {
    
    public String bankName{get; set;}
    public String IFSC{get; set;}
    public List<BankAccount> accounts{get; set;}
    public Bank(){}
    public Bank(String bankName, String IFSC, List<BankAccount> accounts) {
        this.bankName = bankName;
        this.IFSC = IFSC;
        this.accounts = accounts;
    }
    public BankAccount getAccountByNumber(Integer accountNumber) {
        BankAccount foundAccount= null;
        for(BankAccount account: accounts) {
            if(account.accountNumber == accountNumber) {
                foundAccount = account;
                break;
            }
        }
        return foundAccount;
    }
    
    
    public Boolean deposit(Integer accountNumber, Double amount) {
        BankAccount account = getAccountByNumber(accountNumber);
        if(account == null) {
            // System.debug('Account not found');
            throw new InvalidAccountException('Account Number '+accountNumber+' is invalid.');
        }
        account.balance += amount;

        // Simulate deposit operation
        System.debug('Deposited ' + amount + ' to account ' + accountNumber);
        System.debug('New Balance: ' + account.balance);
        return true;
    }
    public Boolean withdraw(Integer accountNumber, Double amount) {
        BankAccount account = getAccountByNumber(accountNumber);
        if(account == null) {
            throw new InvalidAccountException('Account Number '+accountNumber+' is invalid.');
        }
        if(account.balance < amount) {
            throw new InsufficientBalanceException('Insufficient balance in account '+accountNumber);
        }
        account.balance -= amount;

        // Simulate withdraw operation
        System.debug('Withdrew ' + amount + ' from account ' + accountNumber);
        System.debug('New Balance: ' + account.balance);
        return true;
    }
    public Boolean transfer(Integer fromAccount, Integer toAccount, Double amount) {
        // BankAccount sourceAccount = getAccountByNumber(fromAccount);
        // BankAccount destinationAccount = getAccountByNumber(toAccount);
        // if(sourceAccount == null || destinationAccount == null) {
        //     System.debug('One or both accounts not found');
        //     return false;
        // }
        // if(sourceAccount.balance < amount) {
        //     System.debug('Insufficient balance in source account');
        //     return false;
        // }
        // sourceAccount.balance -= amount;
        // destinationAccount.balance += amount;
        // System.debug('Transferred ' + amount + ' from account ' + fromAccount + ' to account ' + toAccount);
        // System.debug('Source Account New Balance: ' + sourceAccount.balance);
        // System.debug('Destination Account New Balance: ' + destinationAccount.balance);
        // return true;   
        Boolean withdrawStatus = withdraw(fromAccount, amount);
        if(!withdrawStatus) {
            return false;
        }
        Boolean depositStatus = deposit(toAccount, amount);
        if(!depositStatus) {
            //rollback withdraw
            deposit(fromAccount, amount);
            return false;
        }
        
        return true;
        
     }
}