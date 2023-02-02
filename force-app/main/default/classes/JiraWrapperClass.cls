public class JiraWrapperClass {
        public user user{get;set;}
		public String issue_event_type_name{get;set;}
		public issue issue{get;set;}
		public String webhookEvent{get;set;}
		public changelog changelog{get;set;}
		public Decimal timestamp{get;set;}
	public class watches{
		public Boolean isWatching{get;set;}
		public Integer watchCount{get;set;}
		public String self{get;set;}
	}
	public class votes{
		public Integer votes{get;set;}
		public Boolean hasVoted{get;set;}
		public String self{get;set;}
	}
    
    
    
	public class user{
		public String timeZone{get;set;}
		public String displayName{get;set;}
		//public avatarUrls avatarUrls{get;set;}
		public Boolean active{get;set;}
		public String accountId{get;set;}
		public String accountType{get;set;}
		public String self{get;set;}
	}
	public class statusCategory{
		public String self{get;set;}
		public String colorName{get;set;}
		public String key{get;set;}
		public String name{get;set;}
		public Integer id{get;set;}
	}
	public class status{
		public String name{get;set;}
		public String id{get;set;}
		public statusCategory statusCategory{get;set;}
		public String iconUrl{get;set;}
		public String description{get;set;}
		public String self{get;set;}
	}
	public class reporter{
		public String self{get;set;}
		public String accountId{get;set;}
		//public avatarUrls avatarUrls{get;set;}
		public String timeZone{get;set;}
		public Boolean active{get;set;}
		public String accountType{get;set;}
		public String displayName{get;set;}
	}
	public class project{
		//public avatarUrls avatarUrls{get;set;}
		public String projectTypeKey{get;set;}
		public String name{get;set;}
		public Boolean simplified{get;set;}
		public String key{get;set;}
		public String id{get;set;}
		public String self{get;set;}
	}
	public class progress{
		public Integer progress{get;set;}
		public Integer total{get;set;}
	}
	public class priority{
		public String name{get;set;}
		public String self{get;set;}
		public String iconUrl{get;set;}
		public String id{get;set;}
	}
	public class nonEditableReason{
		public String reason{get;set;}
		public String message{get;set;}
	}
	public class items{
		public String field{get;set;}
		public String fromString{get;set;}
		public String from1{get;set;}
		public String to{get;set;}
		public String fieldId{get;set;}
		public String toString{get;set;}
		public String fieldtype{get;set;}
	}
	public class issuetype{
		public Integer hierarchyLevel{get;set;}
		public String name{get;set;}
		public String iconUrl{get;set;}
		public Boolean subtask{get;set;}
		public String description{get;set;}
		public Integer avatarId{get;set;}
		public String id{get;set;}
		public String entityId{get;set;}
		public String self{get;set;}
	}
	public class issuerestriction{
		//public issuerestrictions issuerestrictions{get;set;}
		public Boolean shouldDisplay{get;set;}
	}
	public class issue{
		public String key{get;set;}
		public String self{get;set;}
		public fields fields{get;set;}
		public String id{get;set;}
	}
	public class fields{
		public String updated{get;set;}
		public String customfield_10010{get;set;}
		public String description{get;set;}
		public String customfield_10014{get;set;}
		public String timeoriginalestimate{get;set;}
		public String customfield_10015{get;set;}
		public list<String> components{get;set;}
		//public timetracking timetracking{get;set;}
		public status status{get;set;}
		public String customfield_10005{get;set;}
		public String assignee{get;set;}
		public String customfield_10006{get;set;}
		public list<String> issuelinks{get;set;}
		public String customfield_10007{get;set;}
		public list<String> versions{get;set;}
		public String security{get;set;}
		public String timeestimate{get;set;}
		public String customfield_10008{get;set;}
		public String aggregatetimeoriginalestimate{get;set;}
		public list<String> attachment{get;set;}
		public String customfield_10019{get;set;}
		public String customfield_10009{get;set;}
		public customfield_10018 customfield_10018{get;set;}
		public String aggregatetimeestimate{get;set;}
		public String customfield_10024{get;set;}
		public String customfield_10025{get;set;}
		public priority priority{get;set;}
		public list<String> labels{get;set;}
		public String customfield_10023{get;set;}
		public String customfield_10016{get;set;}
		public String customfield_10022{get;set;}
		public String customfield_10017{get;set;}
		public String customfield_10021{get;set;}
		public String summary{get;set;}
		public String customfield_10020{get;set;}
		public creator creator{get;set;}
		public String created{get;set;}
		public list<String> subtasks{get;set;}
		public watches watches{get;set;}
		public reporter reporter{get;set;}
		public issuerestriction issuerestriction{get;set;}
		public String customfield_10000{get;set;}
		public String lastViewed{get;set;}
		public aggregateprogress aggregateprogress{get;set;}
		public Integer workratio{get;set;}
		public String customfield_10001{get;set;}
		public String resolutiondate{get;set;}
		public String customfield_10002{get;set;}
		public String resolution{get;set;}
		public String customfield_10003{get;set;}
		public String aggregatetimespent{get;set;}
		public String customfield_10004{get;set;}
		public list<String> fixVersions{get;set;}
		public String environment{get;set;}
		public project project{get;set;}
		public String duedate{get;set;}
		public String timespent{get;set;}
		public progress progress{get;set;}
		public issuetype issuetype{get;set;}
		public votes votes{get;set;}
		public String statuscategorychangedate{get;set;}
	}
	public class customfield_10018{
		public nonEditableReason nonEditableReason{get;set;}
		public Boolean showField{get;set;}
		public Boolean hasEpicLinkFieldDependency{get;set;}
	}
	public class creator{
		public String displayName{get;set;}
		public String timeZone{get;set;}
		public Boolean active{get;set;}
		public String accountType{get;set;}
		//public avatarUrls avatarUrls{get;set;}
		public String accountId{get;set;}
		public String self{get;set;}
	}
	public class changelog{
		public String id{get;set;}
		public list<items> items{get;set;}
	}
	
	public class aggregateprogress{
		public Integer progress{get;set;}
		public Integer total{get;set;}
	}
}