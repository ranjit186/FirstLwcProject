public class JiraParticularCommentWrapperClass{
		public updateAuthor updateAuthor{get;set;}
		public body body{get;set;}
		public String created{get;set;}
		public author author{get;set;}
		public String updated{get;set;}
		public String id{get;set;}
		public Boolean jsdPublic{get;set;}
		public String self{get;set;}
	public class updateAuthor{
		public String displayName{get;set;}
		public Boolean active{get;set;}
		public String emailAddress{get;set;}
		public String timeZone{get;set;}
		public String accountId{get;set;}
		public String accountType{get;set;}
		public String self{get;set;}
	}
	public class content{
		public attrs attrs{get;set;}
		public String type{get;set;}
		//public String type{get;set;}
		public list<content> content{get;set;}
	}
	public class body{
		public String type{get;set;}
		public list<content> content{get;set;}
		public Integer version{get;set;}
	}

	public class author{
		public String accountType{get;set;}
		public String displayName{get;set;}
		public String emailAddress{get;set;}
		public Boolean active{get;set;}
		public String accountId{get;set;}
		public String timeZone{get;set;}
		public String self{get;set;}
	}
	public class attrs{
		public String collection{get;set;}
		public String type{get;set;}
		public Integer width{get;set;}
		public String id{get;set;}
		public Integer height{get;set;}
		public String layout{get;set;}
	}
}