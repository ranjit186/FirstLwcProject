import { LightningElement } from 'lwc';
import insertdata from '@salesforce/apex/testInsertContactData.insertdata';
import getAllAccount from '@salesforce/apex/testInsertContactData.getAllAccount';

export default class Createcontact extends LightningElement {

    AllData;
    allAccounts;
    
    allOptionAccount;
    async connectedCallback() {
        let acc = await getAllAccount();
        console.log('----acc----',acc);
        let tempOption = [{'label':'none', 'value':''}];
        this.allAccounts = acc;
        console.log('----allAccounts----'+JSON.stringify(this.allAccounts, null, 4));
        for(let i = 0; i <this.allAccounts.length; i++){
            console.log('----acc----',this.allAccounts[i]);
            tempOption.push({'label': this.allAccounts[i].Name, 'value': this.allAccounts[i].Id});
        }
        this.allOptionAccount = tempOption;
    }
    get selectedId(){
        return this.allOptionAccount?.Id;
    }

    handlechange = async (event) => {
        let value = event.target.value;
        let name = event.target.name;
        this.AllData = { ...this.AllData, [name]: value };
    }

    insertDAta = async () => {
        console.log('--this.AllData--', this.AllData);
        let Data = await insertdata({ 'datas': JSON.stringify(this.AllData) });
        console.log("--Data--", Data);
    }
}