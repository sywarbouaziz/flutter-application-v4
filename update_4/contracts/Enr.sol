// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract Enr{
    struct Client{
        string imagehash;
        string nom;
        string prenom;
        string email;
        uint numtel;
        string adresse;
        string password;
        bool exists;
        
    }
    struct Product{
        string imagehash;
        string nomProduct;
        string category;
        string price;
        string description;
      
        
    }
    struct Fournisseur{
        string imageHash;
        string nomEnt;
        string email;
        uint numtel;
        string addEnt;
        string ethaddress;
        string categorie;
       string password;
        bool exist;
        
    }
     struct FournisseurProduct{
        string email;
        Product[]products;
        bool exist;
        
    }
    
    //mapping(address=>Client)public clients;
    mapping(string => Client) private clients;
     mapping(string => Fournisseur) private fournisseurs;
      mapping(string => FournisseurProduct) private fournisseurproducts;
      
      
      function userExists(string memory email) public view returns (bool) {
    
    return clients[email].exists;}
          
     
     
     
     function loginC(string memory email,string memory pass)public view returns(bool){
         return (clients[email].exists&&(keccak256(abi.encodePacked(clients[email].password)) ==
            keccak256(abi.encodePacked(pass))));
     }
      function loginF(string memory email,string memory pass)public view returns(bool){
         return (fournisseurs[email].exist&&(keccak256(abi.encodePacked(fournisseurs[email].password)) ==
            keccak256(abi.encodePacked(pass))));
     }

    function registrationC(
         string memory imagehash, 
        string memory nom,
        string memory prenom,
         
        string memory email,
        uint numtel,
        string memory adresse,
         string memory password
        ) 
        public {
        //require(!users[msg.sender], "User already added");
         require(!userExists(email), "User already registered with email");
        Client memory newUser = Client(imagehash,nom,prenom,email,numtel,adresse,password,true);
        clients[email] = newUser;
     }
      function getUserF(string memory email) public view returns (string memory,string memory,string memory,uint,string memory,string memory,string memory,string memory) {
        Fournisseur memory user = fournisseurs[email];
        return (user.imageHash,user.nomEnt,user.email,user.numtel,user.addEnt,user.ethaddress,user.categorie,user.password);}
     function addP(
        string memory email,
         string memory imagehash,
         string memory nomProduct,
         string memory category,
         string memory price,
         string memory description
        ) 
        public {
        //require(!users[msg.sender], "User already added");
         require(!userExists(email), "User already registered with email");
        Product memory newUser = Product(imagehash,
        nomProduct,
        category,
        price,
        description);
        fournisseurproducts[email].email=email;
        fournisseurproducts[email].products.push(newUser);
        fournisseurproducts[email].exist=true;
     }
    function updatepassword(string memory tt,string memory email )public
    {
        fournisseurs[email].password=tt;
          
    }
     function updateclient(string memory iphash,string memory nom,string memory prenom,string memory email,uint numtel,string memory add,string memory pass )public
    {
         Client memory newUser = Client(iphash,nom,prenom,email,numtel,add,pass,true);
          clients[email]=newUser;
    }
    function registrationF(
        string memory imageHash,
        string memory nomEnt,
        string memory email,
        uint numtel,
        string memory addEnt,
        string memory ethaddress,
        string memory categorie,
       string memory password
      
        
        ) 
        public {
        //require(!users[msg.sender], "User already added");
         require(!userExists(email), "User already registered with email");
        Fournisseur memory newUser = Fournisseur(imageHash,nomEnt,email,numtel,addEnt,
        ethaddress,categorie,password,true);
        fournisseurs[email] = newUser;
        
        
        
    }
    function getUserC(string memory email) public view returns (string memory,string memory,string memory,string memory,uint,string memory,string memory) {
        Client memory user = clients[email];
        return (user.imagehash,user.nom,user.prenom,user.email,user.numtel,user.adresse,user.password);}
    function getProduct(string memory email) public view returns (string memory,Product[]memory) {
        FournisseurProduct memory user = fournisseurproducts[email];
        return (user.email,user.products);}

   
 

}