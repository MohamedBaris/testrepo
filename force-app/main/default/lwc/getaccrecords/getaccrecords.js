import { LightningElement,wire,api} from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import id_field from '@salesforce/schema/Contact.Id'
import Name_field from '@salesforce/schema/Contact.LastName'

const FIELDS = [
   'Contact.Name',
   'Contact.Id',
   
];
export default class Getaccrecords extends LightningElement {
   @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    contact;

    get name() {
        return this.contact.data.fields.Name.value;
    }

    get ids() {
        return this.contact.data.fields.Id.value;
    }

  
}