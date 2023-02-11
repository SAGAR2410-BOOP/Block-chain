import { LightningElement,track } from 'lwc' ;
import getapexnft from '@salesforce/apex/apexnft.getapexnft';

export default class Nft extends LightningElement {

    @track ImageReady = false;
    @track loadingSpinner = false;
    @track pictureUrl;
    @track nft1 ={};
    @track nftList = [];
    @track nft = {};
    
    handleclick(){
    
        this.loadingSpinner=true;
        this.imageReady=false;
        
        
        getapexnft({}).then((result) =>{
            this.pictureUrl = result;
            console.log(this.pictureUrl);
            console.log(result);
            console.log('ABC'+JSON.parse(result));
            this.response = JSON.parse(result);
            console.log(typeOf(result))
            this.pictureUrl=JSON.parse(result);
            console.log(result);
            
             let response = JSON.parse(result);
             console.log(response);
             console.log(result);
             
             this.nft = result;
             console.log(this.nft);
             this.nft1 = response.nft1;
             this.pictureUrl = this.nft1.url;

             this.loadingSpinner=false;
             this.imageReady=true;
        }).catch(e => {
        console.log(e);
        });
    }
}