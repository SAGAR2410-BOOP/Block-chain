public with sharing class nft1 {
    
    public class NFTApex {
        public String name;
        public Integer price;
        public Integer tokenId;
        public String description;
        public String pictureurl;
        
        //public String ;
    }
    @AuraEnabled
    //public static List<Map<String,Object>> getapexnft(){
        public static String getapexnft(){
    

        //List<Map<String,Object>> nftLis = new List<Map<String,Object>>();
        //List<NFTApex> nftLis = new List<NFTApex>();


        Http http = new http();
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://hexanft.hexaview.in/');
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        system.debug('res.getBody'+res.getBody());
        system.debug(res.getStatusCode());
        
        List<Object> nftList = new List<Object>();
        nftList  = (List<Object>) JSON.deserializeUntyped(res.getBody());
        system.debug(nftList);
        List<All_NFt__c> myNftList  = new List<All_NFt__c>();
        For(Object key: nftList){
            map<String,Object> mapKey = (map<String,Object>) key;
            system.debug(mapKey);
            All_NFt__c nft = new All_NFt__c();
            nft.Name__c = (String)mapKey.get('name');
            nft.Price__c = Double.valueOf(mapKey.get('price'));
            nft.TokenId__c=Integer.valueOf(mapKey.get('tokenId'));
            nft.Description__c=(String)mapKey.get('description');
            nft.PictureUrl__c=(String)mapKey.get('pictureurl');
            myNftList.add(nft);
            
        }
        insert myNftList;

        //return res;
        
        //return res;
        return res.getBody();

        
        //List<Object> nftList  = (List<Object>) JSON.deserializeUntyped(res.getBody());
        //system.debug(nftList );
        //List<My_NFT__c> myNftList  = new List<My_NFT__c>();
        //For(Object key: nftList){
            //map<String,Object> mapKey = (map<String,Object>) key;
            //system.debug(mapKey);
            //My_NFT__c nft = new My_NFT__c();
            //nft.name = (String)mapKey.get('name');
            
            
           // myNftList.add(nft);
        //}
        //insert myNftList;

        //return ('Apex NFT finish');
         //For(String key: response.keySet()){
              //NFTApex n = new NFTApex();
              //System.debug(response.get(key));
              //System.debug(response.get(key).['price']);
            
              //object b = response.get(key);
              //System.debug(n);
              //System.debug(n.price);

        //List<Object> responses  = (List<Object>) JSON.deserializeUntyped(res.getBody());
        //system.debug(responses);
        //return null;

        //For(String key: responses.keySet()){
            //NFTApex n = new NFTApex();
            //System.debug(responses.get(key));
            //n.price = responses.get(key)['price'];
            //n.tokenId = responses.get(key).get.('tokenId');
          
          
          //  n.tokenURI = responses.get(key).get('tokenURI');
           // //nftLis.add((Map<String,Object>) response.get(key));
           // nftLis.add(n);

        // }
        //return ('Apex NFT finish');
         

         

    
    }
    
    

    
}