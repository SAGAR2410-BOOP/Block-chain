public with sharing class nft3 {
    public class NFTApex {
        public String name;
        public Integer price;
        public Integer tokenId;
        public String description;
        
        public String tokenURI;
    }
    @AuraEnabled
    //public static List<Map<String,Object>> getapexnft(){
        public static String getapexnft(String nftData){
    

        //List<Map<String,Object>> nftLis = new List<Map<String,Object>>();
        //List<NFTApex> nftLis = new List<NFTApex>();


        Http http = new http();
        system.debug('nftData : '+nftData);
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://hexanft.hexaview.in/listedNFTs/'+nftData);
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        system.debug('res.getBody'+res.getBody());
        system.debug(res.getStatusCode());
        return res.getBody();
    }
    
}