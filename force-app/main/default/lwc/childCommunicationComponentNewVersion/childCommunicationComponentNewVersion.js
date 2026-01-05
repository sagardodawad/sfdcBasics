import { LightningElement, api } from 'lwc';
export default class ChildCommunicationComponentNewVersion extends LightningElement {
    //public property

    @api contactsinchild;

 

    // Define the columns for the datatable

    columns = [

        { label: 'Name', fieldName: 'Name', type: 'text' },

        { label: 'Email', fieldName: 'Email', type: 'email' }

    ];

}