public class FieldjsonWrapperClass{
		public Boolean isLast{get;set;}
		public Integer total{get;set;}
		public Integer startAt{get;set;}
		public list<values> values{get;set;}
		public Integer maxResults{get;set;}
	public class values{
		public schema schema{get;set;}
		public String name{get;set;}
		public String description{get;set;}
		public String id{get;set;}
	}
	public class schema{
		public String type{get;set;}
		//public String system{get;set;}
		public String items{get;set;}
	}
}