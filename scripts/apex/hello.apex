// HelloWorld obj=new HelloWorld();
// obj.sayHello();


// Person person = new Person('Akash','akash@gmail.com',98765,'Pune');
// String res=person.greetUser('Akash');
// System.debug(res);
// System.debug(person.toString());


// Employee emp=new Employee();
// emp.name='John Doe';
// emp.email='john.doe@example.com';
// emp.phone=123456;
// emp.address='123 Main St';
// emp.empId=101;
// emp.designation='Developer';
// System.debug(emp.toString());
// System.debug(emp.greetUser('John Doe'));

// Address addr=new Address(12,'MG Road','Pune','MH','411001');
// Person per =new Person('Akash','akash@gmail.com',98765, addr);
// System.debug(per.toString());


// PremiumCalculation pc=new PremiumCalculation( 50000, 4,'Unmarried','Temporary Job');
// double premium=pc.calculatePremium(pc.income, pc.maritalStatus, pc.EmployeeStatus, pc.serviceYears);
// System.debug('Calculated Premium: '+premium);


// Notification notification=new Notification();
// notification.sendNotification('This is a general notification.');
// EmailNotification emailNotif=new EmailNotification();
// emailNotif.sendNotification('This is an email notification.');
// SMSNotification smsNotif=new SMSNotification();
// smsNotif.sendNotification('This is an SMS notification.');



// Payment payment=new Payment();
// payment.processPayment(250);    
// payment.processPayment(100, 'Credit Card');
// payment.processPayment(200, 'PayPal', 10);

// ListDemo.main();


// Set<Integer> data=new Set<Integer>();
 
// data.add(10);
// data.add(20);
// data.add(10);  
// System.debug('Set contents: '+data);
 
// Set<Employee> emps=new Set<Employee>();
// Address add1=new Address(12,'MG Road','Pune','MH','411001');
// Address add2=new Address(34,'FC Road','Pune','MH','411002');
 
// Employee emp1=new Employee('john','john@gmail.com',123456,add1,101,'Developer');
// Employee emp2=new Employee('ram','ram@gmail.com',123456,add2,102,'Developer');
// emps.add(emp1);
// emps.add(emp2);
// emps.add(emp2);
// System.debug('Employee Set contents: '+emps);



// BankAccount acc1=new BankAccount(1001,'Alice',5000,'Savings');
// BankAccount acc2=new BankAccount(1002,'Bob',3000,'Checking');

// List<BankAccount> accounts=new List<BankAccount>();
// accounts.add(acc1);
// accounts.add(acc2);
// System.debug('Bank Accounts: '+accounts);


// Bank sbi=new Bank('State Bank of India', 'SBIN0001234',accounts);
// System.debug('Bank Details: '+sbi);

// System.debug('Deposit Operation: ' + sbi.deposit(1001, 2000));

// System.debug('Withdraw Operation: ' + sbi.withdraw(1002, 1000));

// System.debug('Transfer Operation: ' + sbi.transfer(1001, 1002, 500));


// MapDemo.main();


// Store store=new Store(
//     1,
//     'Tech Store',
//     'Downtown',
//     new List<Product>{
//         new Product(1, 'Laptop', 10, 750, 'Electronics'),
//         new Product(2, 'Smartphone', 20, 500, 'Electronics'),
//         new Product(3, 'Headphones', 15, 150, 'Accessories'),
//         new Product(4, 'Camera', 8, 900, 'Accessories'),
//         new Product(5, 'Smartwatch', 25, 200, 'Accessories')

//     }
// );

// System.debug('Store Details: ' + store);
// System.debug('Products in Store: ' + store.products);
// store.products.add(new Product(6, 'Tablet', 12, 300, 'Electronics'));
// System.debug('Updated Products in Store: ' + store.products);
// double revenue = store.sellProduct(2, 5);
// System.debug('Revenue from Sale: ' + revenue);
// System.debug('Products after Sale: ' + store.products);


// store.purchaseProduct(3, 10);
// System.debug('Products after Purchase: ' + store.products);

// double revenueAfterSecondSale = store.sellProduct(3, 24);
// System.debug('Revenue from Second Sale: ' + revenueAfterSecondSale);
// System.debug('Products after Second Sale: ' + store.products);


// List<Product> electronics = store.getProductsByCategory('Electronics');
// System.debug('Electronics Products: ' + electronics);




BankAccount acc1=new BankAccount(1001,'Alice',5000,'Savings');
BankAccount acc2=new BankAccount(1002,'Bob',3000,'Checking');


List<BankAccount> accounts=new List<BankAccount>();
accounts.add(acc1);
accounts.add(acc2);
// System.debug('Bank Accounts: '+accounts);
Bank sbi=new Bank('State Bank of India', 'SBIN0001234',accounts);
// System.debug('Bank Details: '+sbi);
try {
    // sbi.deposit(9999, 2000);
    // sbi.withdraw(8888, 1000);
    sbi.withdraw(1002, 5000);
} catch (InvalidAccountException e) {
    System.debug('Error: ' + e.getMessage());
} catch (InsufficientBalanceException e) {
    System.debug('Error: ' + e.getMessage());
}