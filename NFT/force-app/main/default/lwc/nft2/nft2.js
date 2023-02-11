import { LightningElement,track } from 'lwc';

import getapexnft from '@salesforce/apex/nft2.getapexnft';

export default class Nft1 extends LightningElement {
    @track ImageReady = true;
    @track loadingSpinner = false;
    //@track tokenId;
    //@track nft={};
    @track nft2={};
    @track res;

    //@track nft1 ={};
    @track nftList = [];
    @track nft = {};
    @track Useraddress = '';
    @track Search;

    setUserAddress(event){
        this.Useraddress=event.target.value;
    }
    handleclickToGetAddress(){
        this.Search=true;
        console.log('user address: '+this.Useraddress);
        this.handleclick(this.Useraddress);
    }



    handleclick( Useraddress){
        console.log('button is clicked in nft1sfs');
        this.loadingSpinner=true;
        this.imageReady=false;
        
        
        getapexnft({nftData : Useraddress}).then((result) =>{
            console.log('apex response', result);
            //this.res=JSON.parse(result)
            

            // this.pictureUrl = result;
            //console.log(this.pictureUrl);
            //console.log('ABC'+JSON.parse(result));
            //this.response = JSON.parse(result);
            //console.log(typeOf(result))
            //this.pictureUrl=JSON.parse(result);
            //console.log(result);
            
             //let response = JSON.parse(result);
             //console.log(response);
             //this.nft = result;
             //console.log(this.nft);
             //this.nft1 = response.nft1;
             //this.tokenURI = this.nft1.url;
            this.res = JSON.parse(result);
            //this.nftList = this.res;
            this.loadingSpinner=false;

            this.imageReady=true;
        }).catch(e => {
        this.loadingSpinner=false;
        //console.log('Invalid address',e.message);
        
        console.log('exception' ,e.message);
        // console.log(e.body.message);
        });
    }

}