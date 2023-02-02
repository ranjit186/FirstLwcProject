public class SearchJiraIssueWrapperClass{
		public String key{get;set;}
		public String self{get;set;}
		public String id{get;set;}
		public fields fields{get;set;}
		public String expand{get;set;}
	public class worklog{
		public Integer startAt{get;set;}
		public Integer maxResults{get;set;}
		public list<String> worklogs{get;set;}
		public Integer total{get;set;}
	}
	public class watches{
		public Boolean isWatching{get;set;}
		public Integer watchCount{get;set;}
		public String self{get;set;}
	}
	public class votes{
		public Boolean hasVoted{get;set;}
		public Integer votes{get;set;}
		public String self{get;set;}
	}
	public class updateAuthor{
		//public avatarUrls avatarUrls{get;set;}
		public String accountId{get;set;}
		public String self{get;set;}
		public String emailAddress{get;set;}
		public String timeZone{get;set;}
		public Boolean active{get;set;}
		public String accountType{get;set;}
		public String displayName{get;set;}
	}
	public class statusCategory{
		public String name{get;set;}
		public String key{get;set;}
		public Integer id{get;set;}
		public String colorName{get;set;}
		public String self{get;set;}
	}
	public class status{
		public String name{get;set;}
		public statusCategory statusCategory{get;set;}
		public String id{get;set;}
		public String description{get;set;}
		public String iconUrl{get;set;}
		public String self{get;set;}
	}
	public class reporter{
		public String self{get;set;}
		public String emailAddress{get;set;}
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
		public String self{get;set;}
		public String name{get;set;}
		public String iconUrl{get;set;}
		public String id{get;set;}
	}
	public class nonEditableReason{
		public String message{get;set;}
		public String reason{get;set;}
	}
	public class issuetype{
		public Integer avatarId{get;set;}
		public String name{get;set;}
		public Boolean subtask{get;set;}
		public String iconUrl{get;set;}
		public Integer hierarchyLevel{get;set;}
		public String description{get;set;}
		public String id{get;set;}
		public String self{get;set;}
	}
	public class issuerestriction{
		//public issuerestrictions issuerestrictions{get;set;}
		public Boolean shouldDisplay{get;set;}
	}
	public class fields{
		public String customfield_10006{get;set;}
		public String customfield_10005{get;set;}
		//public timetracking timetracking{get;set;}
		public String customfield_10007{get;set;}
		public String customfield_10015{get;set;}
		public String security{get;set;}
		public String customfield_10014{get;set;}
		public String customfield_10008{get;set;}
		public String customfield_10010{get;set;}
		public String aggregatetimeestimate{get;set;}
		public description description{get;set;}
		public list<attachment> attachment{get;set;}
		public String aggregatetimeoriginalestimate{get;set;}
		public String customfield_10019{get;set;}
		public String timeestimate{get;set;}
		public customfield_10018 customfield_10018{get;set;}
		public list<String> versions{get;set;}
		public String customfield_10017{get;set;}
		public list<String> issuelinks{get;set;}
		public String customfield_10016{get;set;}
		public String assignee{get;set;}
		public list<String> labels{get;set;}
		public String updated{get;set;}
		public String customfield_10025{get;set;}
		public status status{get;set;}
		public String customfield_10024{get;set;}
		public list<String> components{get;set;}
		public String customfield_10023{get;set;}
		public String timeoriginalestimate{get;set;}
		public priority priority{get;set;}
		public String customfield_10009{get;set;}
		public String customfield_10022{get;set;}
		public String summary{get;set;}
		public String customfield_10021{get;set;}
		public creator creator{get;set;}
		public String customfield_10020{get;set;}
		public list<String> subtasks{get;set;}
		public String created{get;set;}
		public reporter reporter{get;set;}
		public watches watches{get;set;}
		public String customfield_10000{get;set;}
		public String lastViewed{get;set;}
		public aggregateprogress aggregateprogress{get;set;}
		public issuerestriction issuerestriction{get;set;}
		public String customfield_10001{get;set;}
		public Integer workratio{get;set;}
		public String customfield_10002{get;set;}
		public String resolutiondate{get;set;}
		public String customfield_10003{get;set;}
		public list<String> customfield_10029{get;set;}
		public String customfield_10004{get;set;}
		public String resolution{get;set;}
		public String environment{get;set;}
		public String aggregatetimespent{get;set;}
		public String duedate{get;set;}
		public list<String> fixVersions{get;set;}
		public progress progress{get;set;}
		public project project{get;set;}
		public comment comment{get;set;}
		public String timespent{get;set;}
		public votes votes{get;set;}
		public issuetype issuetype{get;set;}
		public worklog worklog{get;set;}
		public String statuscategorychangedate{get;set;}
	}
	public class description{
		public list<content> content{get;set;}
		public String type{get;set;}
		public Integer version{get;set;}
	}
	public class customfield_10018{
		public nonEditableReason nonEditableReason{get;set;}
		public Boolean showField{get;set;}
		public Boolean hasEpicLinkFieldDependency{get;set;}
	}
	public class creator{
		public String accountId{get;set;}
		public String displayName{get;set;}
		//public avatarUrls avatarUrls{get;set;}
		public Boolean active{get;set;}
		public String emailAddress{get;set;}
		public String timeZone{get;set;}
		public String self{get;set;}
		public String accountType{get;set;}
	}
	public class content{
		public list<content> content{get;set;}
		public String type{get;set;}
		public attrs attrs{get;set;}
		//public String type{get;set;}
		//public String type{get;set;}
		public String text{get;set;}
		//public attrs attrs{get;set;}
		//public list<content> content{get;set;}
		//public String type{get;set;}
	}
	public class comments{
		public String id{get;set;}
		public String created{get;set;}
		public String updated{get;set;}
		public updateAuthor updateAuthor{get;set;}
		public Boolean jsdPublic{get;set;}
		public body body{get;set;}
		public author author{get;set;}
		public String self{get;set;}
	}
	public class comment{
		public list<comments> comments{get;set;}
		public String self{get;set;}
		public Integer maxResults{get;set;}
		public Integer startAt{get;set;}
		public Integer total{get;set;}
	}
	public class body{
		public list<content> content{get;set;}
		public String type{get;set;}
		public Integer version{get;set;}
	}
	
	public class author{
		public String emailAddress{get;set;}
		public Boolean active{get;set;}
		public String timeZone{get;set;}
		public String displayName{get;set;}
		public String accountType{get;set;}
		//public avatarUrls avatarUrls{get;set;}
		public String self{get;set;}
		public String accountId{get;set;}
		//public String accountId{get;set;}
		//public String self{get;set;}
		//public String emailAddress{get;set;}
		//public Boolean active{get;set;}
		//public String timeZone{get;set;}
		//public String displayName{get;set;}
		//public String accountType{get;set;}
		//public avatarUrls avatarUrls{get;set;}
	}
	public class attrs{
		public Integer height{get;set;}
		public String type{get;set;}
		public String collection{get;set;}
		public String id{get;set;}
		public Integer width{get;set;}
		public String layout{get;set;}
	}
	public class attachment{
		public author author{get;set;}
		public String mimeType{get;set;}
		public Integer size{get;set;}
		public String content{get;set;}
		public String created{get;set;}
		public String thumbnail{get;set;}
		public String filename{get;set;}
		public String id{get;set;}
		public String self{get;set;}
	}
	public class aggregateprogress{
		public Integer progress{get;set;}
		public Integer total{get;set;}
	}
}