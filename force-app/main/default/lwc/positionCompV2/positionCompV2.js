import getOpenPositionRecords from '@salesforce/apex/PositionController.getOpenPositionRecords';
import { LightningElement, wire } from 'lwc';

export default class PositionCompV2 extends LightningElement {
    openPositionList = [];

    @wire(getOpenPositionRecords)
    upperCaseLocation({ data, error }) {
        if (data) {
            this.openPositionList = [];
            data.forEach((i) => {
                const obj = {
                    Id: i.Id,
                    Name: i.Name,
                    Open_Date__c: i.Open_Date__c,
                    Close_Date__c: i.Close_Date__c,
                    Department__c: i.Department__c,
                    Location__c: i.Location__c ? i.Location__c.toUpperCase() : ''
                };
                this.openPositionList.push(obj);
            });
        } else if (error) {
            console.error('Error:', error);
        }
    }
}
