public class AccountsResult{
  @AuraEnabled public List<Map<String, String>> types{get; set;}
  @AuraEnabled public List<Map<String, String>> ratings{get; set;}
  @AuraEnabled public List<Account> accounts{get; set;}
  @AuraEnabled public Integer last_page{get; set;}
}
