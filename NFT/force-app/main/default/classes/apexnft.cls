public with sharing class apexnft {

    public class NFTApex {
        public Integer price;
        public String name;
        public String description;
        public String url;
    }

    @AuraEnabled
    //public static List<Map<String,Object>> getapexnft(){
        public static String getapexnft(){
    

        //List<Map<String,Object>> nftLis = new List<Map<String,Object>>();
        List<NFTApex> nftLis = new List<NFTApex>();


        Http http = new http();
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://mayank151c.github.io/Api-Testing/');
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        system.debug('res.getBody'+res.getBody());
        List<Object> nftList  = (List<Object>) JSON.deserializeUntyped(res.getBody());
        system.debug(nftList );
        
        // For(String key: responses.keySet()){
        //     NFTApex n = new NFTApex();
        //     System.debug(responses.get(key));
        //     //System.debug(responses.get(key).['name']);
            
        //     object b = responses.get(key);
        //     System.debug(n);
        //     System.debug(n.name);

        // }
        //List<Object> response  = (List<Object>) JSON.deserializeUntyped(res.getBody());
        //system.debug(response);
        // return null;
        

       // For(String key: responses.keySet()){
          //  NFTApex n = new NFTApex();
          //  System.debug(responses.get(key));
           // n.name = responses.get(key)['name'];
          //  n.description = responses.get(key).get('description');
          //  n.price = responses.get(key).get('price');
          //  n.url = responses.get(key).get('url');
           // //nftLis.add((Map<String,Object>) response.get(key));
           // nftLis.add(n);

        // }
         //Map<String,Object> nft1 = (Map<String,Object>) response.get('nft1');
         //String url =(String) nft1.get('url')

       // List<Map<String,Object>> nftListIn = new List<Map<String,Object>>s();
    //     List<My_NFT__c> myNFTList = new List<My_NFT__c>();
    //     for (NFTApex nt : nftList) {
    //         //system.debug(JSON.serialize(nt));
    //         My_NFT__c nft = new My_NFT__c();
    //         nft.Name__c =  nt.name;
    //         nft.Price__c = nt.price;
    //         nft.Description__c = nt.description;
    //         //nft.URL__c= nft.url;
    //         myNFTList.add(nft);
    //     }
    //     system.debug(myNFTList);
    //    // return nftLis;
    //     insert myNFTList;
        return ('Apex NFT finish');
        
    }
     
    

}
