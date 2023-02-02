public class JiraParticularUserWrapperClass{
		public Boolean active{get;set;}
		public String displayName{get;set;}
		public String timeZone{get;set;}
		public String locale{get;set;}
		public String emailAddress{get;set;}
		public groups groups{get;set;}
		public String accountType{get;set;}
		public applicationRoles applicationRoles{get;set;}
		public String accountId{get;set;}
		public String expand{get;set;}
		public String self{get;set;}
	public class groups{
		public Integer size{get;set;}
		public list<String> items{get;set;}
	}
	
	public class applicationRoles{
		public Integer size{get;set;}
		public list<String> items{get;set;}
	}
}