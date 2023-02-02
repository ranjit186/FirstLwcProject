public class SearchJiraProjectWrapperClass {
        public list<issueTypes> issueTypes{get;set;}
        public list<String> versions{get;set;}
        public String name{get;set;}
        public String assigneeType{get;set;}
        //public roles roles{get;set;}
        public list<String> components{get;set;}
      
        public lead lead{get;set;}
        public String projectTypeKey{get;set;}
        public String description{get;set;}
        public Boolean simplified{get;set;}
        public String key{get;set;}
        public String style{get;set;}
        public String id{get;set;}
        public Boolean isPrivate{get;set;}
        public String self{get;set;}
      //  public properties properties{get;set;}
        public String expand{get;set;}
        
       
        public class lead{
            public String displayName{get;set;}
           // public avatarUrls avatarUrls{get;set;}
            public String accountId{get;set;}
            public Boolean active{get;set;}
            public String self{get;set;}
        }
        public class issueTypes{
            public String name{get;set;}
            public String iconUrl{get;set;}
            public Boolean subtask{get;set;}
            public String description{get;set;}
            public Integer avatarId{get;set;}
            public String id{get;set;}
            public Integer hierarchyLevel{get;set;}
            public String self{get;set;}
        }
        
    
}