import { LightningElement,wire } from 'lwc';
import deleteAccount from '@salesforce/apex/AccountController.deleteAccount';
import getAllAccounts from '@salesforce/apex/AccountController.getAllAccounts';
import { refreshApex } from '@salesforce/apex';

/*
const actions = [
    { label: 'Edit', name: 'edit' },
    { label: 'Delete', name: 'delete' }
    ];*/

export default class SimpleDataTable extends LightningElement {
    @wire(getAllAccounts)
    accounts;

    selectedRowId;
    
     Accountcolumns = [
        { label: 'Name', fieldName: 'Name', type: 'text' },
        { label: 'AccountNumber', fieldName: 'AccountNumber', type: 'text' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    ];

    handleRowSelection(event){
          const rows = event.detail.selectedRows;
          // create a for loop to handle more than one row.
          if(rows.length ==1){
    
            this.selectedRowId = rows[0].Id;
    
            console.log('You have selected '+this.selectedRowId);
    
            console.log(rows[0].Name);
    
          }
    
         
    
       }
    
     
    
       deleteSelectedRow(){
    
            deleteAccount({accId:this.selectedRowId})  //imperative call
    
            .then(result=>{
    
                if(result){
    
                     alert('Selected Row Deleted..');
    
                     this.template.querySelector('lightning-datatable').selectedRows=[];
    
                    refreshApex(this.accounts);  //reload the latest version of data in browser cache
    
                }
    
            })
    
            .catch(error=>{
    
                alert('Unable to delete:'+error.body.message);
    
            })
    
       }
    
     
    
       
    
       /*
    
       handleRowAction(event){
    
            const actionName = event.detail.action.name;
    
            const row = event.detail.row;
    
            switch (actionName) {
    
                case 'delete':
    
                    alert('Delete Action fired...');
    
                    //this.deleteRow(row);
    
                    break;
    
                case 'edit':
    
                    alert('Edit action fired...');
    
                    //this.showRowDetails(row);
    
                    break;
    
                default:
    
            }
    
        }*/
    
    }
    
     
    
    



 