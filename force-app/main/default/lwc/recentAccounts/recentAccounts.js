// recentAccounts.js
import { LightningElement, wire, track } from 'lwc';
import getRecentAccounts from '@salesforce/apex/AccountController.getRecentAccounts';

export default class RecentAccounts extends LightningElement {
    @track accountList;

    @wire(getRecentAccounts)
    wiredRecentAccounts({ error, data }) {
        if (data) {
            this.accountList = data;
        } else if (error) {
            console.error('Error loading recent accounts', error);
        }
    }
}
