import { LightningElement, wire } from 'lwc';

import getContacts from '@salesforce/apex/ContactController.getContacts';

import addNewContact from '@salesforce/apex/ContactController.addNewContact';

import { refreshApex } from '@salesforce/apex';
export default class ParentCommunicationComponentNewVersion extends LightningElement {

    contacts;

    error;

    newName = '';

    newEmail = '';

    wiredContactsResult;

 

    // Wire to a method

    @wire(getContacts)

    wiredContacts(result) {

        this.wiredContactsResult=result; // refresh apex

        if (result.data) {

            this.contacts = result.data;

            this.error=undefined;

        } else if (result.error) {

            this.contacts=undefined;

            this.error = result.error;

        }

    }

 

    handleNameChange(event) {

        this.newName = event.target.value;

    }

 

    handleEmailChange(event) {

        this.newEmail = event.target.value;

    }

 

    // Add new contact and refresh contact list

    handleAddContact() {

        addNewContact({ name: this.newName, email: this.newEmail })  // imperative call

            .then(() => {

                this.newName = '';

                this.newEmail = '';

                // Refresh the contact list after adding the new contact

                refreshApex(this.wiredContactsResult);

            })

            .catch(error => {

                this.error = error;

            });

    }

 

   

}