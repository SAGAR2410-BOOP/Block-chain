public with sharing class nft2 {

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
        //String link= 'https://hexanft.hexaview.in/myListedNFTs/0xC7268C02d20C0eef02aE7E418C0B5C8a7ACec95a';
        HttpRequest req = new HttpRequest();
        req.setEndpoint(' https://hexanft.hexaview.in/myListedNFTs/'+nftData);
        //req.setEndpoint(link);
        req.setMethod('GET');
        
        HttpResponse res = http.send(req);
        system.debug('res.getBody'+res.getBody());
        system.debug(res.getStatusCode());
        return res.getBody();
    }
    
}