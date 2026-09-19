public class Filters{
  @AuraEnabled public String tag_filter {get; set;}
  @AuraEnabled public String owner_name_filter {get; set;}
  @AuraEnabled public String name_filter {get; set;}
  @AuraEnabled public String type_filter {get; set;}
  @AuraEnabled public String annual_revenue_greater_than_filter {get; set;}
  @AuraEnabled public String annual_revenue_less_than_filter {get; set;}
  @AuraEnabled public String rating_filter {get; set;}
  @AuraEnabled public String city_filter {get; set;}
  @AuraEnabled public String state_filter {get; set;}
  @AuraEnabled public String industry_filter {get; set;}
}
