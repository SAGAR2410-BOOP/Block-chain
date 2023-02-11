import { LightningElement,track } from 'lwc';

import getapexnft from '@salesforce/apex/nft1.getapexnft';

export default class Nft1 extends LightningElement {
    @track ImageReady = true;
    @track loadingSpinner = false;
    //@track tokenId;
    //@track nft={};
    @track nft2={};
    @track res;

    //@track nft1 ={};
    //@track nftList = [];
    //@track nft = {};
    connectedCallback(){
        console.log('called');
        this.method();
    }

    method(){
        console.log('button is clicked in nft1sfs');
        this.loadingSpinner=true;
        this.imageReady=false;
        console.log('going to then');
        
        getapexnft().then((result) =>{
            console.log('apex response', result);
            this.res=JSON.parse(result)
            var tempres=this.res.map((tt,index)=>{
                tt['isLineBreak']=(index+1)%3==0?1:0;
                return tt;
            })
            console.log(tempres);
            this.res=tempres;
            // console.log(this.res);
            console.log('I am here');
            // this.pictureUrl = result;
            //console.log(this.pictureUrl);
            // console.log('api response' ,this.res);
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
            this.nft = this.res;
            this.loadingSpinner=false;

            this.imageReady=true;
        }).catch((e) => {
            console.log('in exception');
            console.log(e);
        console.log('exception <> ' ,e.message);
        // console.log(e.body.message);
        }).finally(() => {
            
        // this.imageReady=true;
        });
    }

}