import { LightningElement, wire} from 'lwc';
import getWonOpportunities from '@salesforce/apex/OpportunityController.getWonOpportunities';

export default class OpportunityCompV2 extends LightningElement {
    // javascript class property
   oppList;
   @wire(getWonOpportunities)
   loadWonDeals({data,error}){
      if(data){  // if(data!=null)
         //as a best practice
         this.oppList = []; //define oppList as an empty array
         // collections.forEach(function(col){});
         data.forEach((opp)=>{
            const obj = {
                    Id: opp.Id,
                    Name: opp.Name,
                    Stage: opp.StageName,
                    CloseDate: opp.CloseDate,
                    Amount: opp.Amount,
                    Commission: opp.Amount * 0.20        
            };
            this.oppList.push(obj);
         });    
      }
   }
}