public with sharing class PremiumCalculation {
    public Integer income{get; set;}
    public Integer serviceYears{get; set;}
    public String maritalStatus{get; set;}
    public String EmployeeStatus{get; set;}
    public PremiumCalculation() {
    }
    public PremiumCalculation(Integer income, Integer serviceYears, String maritalStatus, String EmployeeStatus) {
        this.income = income;
        this.serviceYears = serviceYears;
        this.maritalStatus = maritalStatus;
        this.EmployeeStatus = EmployeeStatus;
    }
    public double calculatePremium(Integer AnnualIncome, String MaritalStatus, String EmploymentType, Integer serviceYear){
        double premium=0.0;
       if(MaritalStatus=='Married'){
           if(EmploymentType=='Temporary Job'){
               if(serviceYear<5) premium=AnnualIncome*0.02;
               else premium=AnnualIncome*0.018;
           }else if(EmploymentType=='Permanent Job'){
                if(serviceYear<5) premium=AnnualIncome*0.015;
                else premium=AnnualIncome*0.013;
            }
       }else if(MaritalStatus=='Unmarried'){
              if(EmploymentType=='Temporary Job'){
                if(serviceYear<5) premium=100000;
                else premium=AnnualIncome*0.022+100000;
              }else if(EmploymentType=='Permanent Job'){
                 if(serviceYear<5) premium=AnnualIncome*0.01;
                 else premium=AnnualIncome*0.008;
                }
       }
        return premium;
    }
}