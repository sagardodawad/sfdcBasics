import { LightningElement ,wire} from 'lwc';
import getPositionRecords from '@salesforce/apex/PositionController.getPositionRecords';
import getOpenPositionRecords from '@salesforce/apex/PositionController.getOpenPositionRecords';

export default class PositionCompV1 extends LightningElement {
    @wire(getPositionRecords)
    positionList;
}