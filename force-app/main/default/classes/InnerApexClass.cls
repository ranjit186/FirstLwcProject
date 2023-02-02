public class InnerApexClass {
	public string companyName;
    public string ceo;
    public integer employeCount;
    public long revenue;
    
    private  List<Client> customers = new List<Client>();
    public void addNewCustomer(string clientName, string website, string email, Long phone){
       	Client customer = new Client(clientName, website, email, phone);
        
        customers.add(customer);
    }
    public void getAllCustomer(){
        
        for(Client customerDetail : customers){
            system.debug( 'Client Name: '+ customerDetail.clientName + ',' + 'Website: ' + customerDetail.website + ',' +  'Email: ' + customerDetail.email + ',' + 'Phone: ' + customerDetail.phone);
        }
    }
    public  class Client{
        public string clientName;
        public string website;
        public string email;
        public Long phone;
        
        Client(string clientName, string website, string email, Long phone){
            this.clientName = clientName;
            this.website = website;
            this.email = email;
            this.phone = phone;
        }
    }
    
}