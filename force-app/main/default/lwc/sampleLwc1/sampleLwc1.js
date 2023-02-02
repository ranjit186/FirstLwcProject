import { LightningElement, track,api } from 'lwc';


export default class HelloWorld extends LightningElement {


    @api greeting = 'Sireesha Ratnam';


    changeHandler(event) {


        this.greeting = event.target.value;


    }


}