import { LightningElement } from 'lwc';

export default class SampleLWC extends LightningElement {
    userName = 'Sagar';
    twoWayBinding(event){
        this.userName = event.target.value;

    }
}