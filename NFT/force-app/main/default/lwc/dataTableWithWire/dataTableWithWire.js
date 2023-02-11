import { LightningElement, track} from 'lwc';
import getapexnft from '@salesforce/apex/nftcontroller.getapexnft';
 

const columns=[
    {label: 'ID', fieldName: 'Id'},
    {label: 'Price',fieldName: 'Price__c',type: 'Number'},
    {label: 'TokenId',fieldName: 'TokenId__c',type: 'Number'},
    {label: 'TokenURI',fieldName: 'TokenURI__c',type: 'URL'},
    {label: 'Name nft', fieldName: 'Name_nft__c'},
    {label: 'Description nft', fieldName: 'Description_nft__c'}
]

export default class DataTableWithWire extends LightningElement {

    //@track searchKey;
    //@wire(getapexnft,{strPrice: '$searchKey'})myNFT;
    //handleKeyChange(event){
        //this.searchKey= this.target.value;
    //}
    @track data=[];
    columns = columns;
    
    // @wire (getapexnft) nftRecords({error,data}){
    //     if(data){
    //         this.data= data;
    //     }
    //     else if(error){
    //         this.data=undefined;

    //     }
    // }



    callme() {
        
    }
    
    connectedCallback() {
        getapexnft({}).then((result) =>{
        console.log('apex response', result);
        //this.data = JSON.parse(result);
        console.log('line 44');
        this.data = result;
        console.log('line 45');
        console.log('parsed data:'+JSON.stringify(this.data));
        
            }).catch(e => {
        console.log('exception' ,e.message);
        // console.log(e.body.message);
        })
        
    }

    ArrayResponse(result) {
        const data = result.map((element)=>{
            return {
                Id: element.Id,
                Price__c: element.price,
                TokenId__c: element.tokenId,
                Name_nft__c: element.name,
                Description_nft__c: element.description
            }
        });
        return data;
    }

    // @wire(getapexnft)
    // nfts;
}