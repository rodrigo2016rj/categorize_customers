public class TagsResult{
  @AuraEnabled public List<Map<String, String>> colors{get; set;}
  @AuraEnabled public List<CustomerTag__c> tags{get; set;}
}
