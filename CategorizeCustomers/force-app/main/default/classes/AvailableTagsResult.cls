public class AvailableTagsResult{
  @AuraEnabled public String account_id{get; set;}
  @AuraEnabled public String account_name{get; set;}
  @AuraEnabled public List<CustomerTag__c> available_tags{get; set;}
}
