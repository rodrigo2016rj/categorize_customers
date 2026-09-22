public with sharing class CustomerTagsController{
  //Show Accounts
  @AuraEnabled(cacheable=false)
  public static AccountsResult aura_show_accounts(Filters filters, String selected_sorting_order, 
Integer current_page, Integer records_per_page){
    //Filters
    String tag_filter = filters.tag_filter;
    String owner_name_filter = filters.owner_name_filter;
    String name_filter = filters.name_filter;
    String type_filter = filters.type_filter;
    String annual_revenue_greater_than_filter = filters.annual_revenue_greater_than_filter;
    String annual_revenue_less_than_filter = filters.annual_revenue_less_than_filter;
    String rating_filter = filters.rating_filter;
    String city_filter = filters.city_filter;
    String state_filter = filters.state_filter;
    String industry_filter = filters.industry_filter;
    
    String filter_query = '';
    
    List<String> tag_filters_list = tag_filter == null ? new List<String>() : tag_filter.split('\\+');
    List<String> tag_filters_list_in_the_query = new List<String>();
    for(Integer i = 0; i < tag_filters_list.size(); i++){
      String filter = super_trim(tag_filters_list[i]);
      if(filter != ''){
        tag_filters_list_in_the_query.add(filter);
      }
    }
    Integer tag_filters_number = tag_filters_list_in_the_query.size();
    if(tag_filters_number > 0){
      Set<Id> account_ids = new Set<Id>();
      String subquery = 'SELECT rodrigo__Account__c account_id FROM';
      subquery += ' rodrigo__CustomerTagAssignment__c WHERE rodrigo__CustomerTag__r.Name';
      subquery += ' = :tag_filters_list_in_the_query GROUP BY rodrigo__Account__c HAVING';
      subquery += ' COUNT_DISTINCT(rodrigo__CustomerTag__c) = :tag_filters_number';
      List<AggregateResult> aggregate_results_list = new List<AggregateResult>();
      aggregate_results_list = Database.query(subquery, AccessLevel.USER_MODE);
      for(AggregateResult aggregate_result : aggregate_results_list){
        account_ids.add((Id) aggregate_result.get('account_id'));
      }
      filter_query += ' AND Id IN :account_ids';
    }
    
    owner_name_filter = super_trim(owner_name_filter);
    if(owner_name_filter != ''){
      owner_name_filter = '%' + owner_name_filter + '%';
      filter_query += ' AND Owner.Name LIKE :owner_name_filter';
    }
    
    name_filter = super_trim(name_filter);
    if(name_filter != ''){
      name_filter = '%' + name_filter + '%';
      filter_query += ' AND Name LIKE :name_filter';
    }
    
    if(type_filter != null && type_filter != ''){
      filter_query += ' AND Type = :type_filter';
    }
    
    Long annual_revenue_filter_a = convert_annual_revenue(annual_revenue_greater_than_filter);
    if(annual_revenue_filter_a != null){
      filter_query += ' AND AnnualRevenue > :annual_revenue_filter_a';
    }
    
    Long annual_revenue_filter_b = convert_annual_revenue(annual_revenue_less_than_filter);
    if(annual_revenue_filter_b != null){
      filter_query += ' AND AnnualRevenue < :annual_revenue_filter_b';
    }
    
    if(rating_filter != null && rating_filter != ''){
      filter_query += ' AND Rating = :rating_filter';
    }
    
    city_filter = super_trim(city_filter);
    if(city_filter != ''){
      city_filter = '%' + city_filter + '%';
      filter_query += ' AND BillingCity LIKE :city_filter';
    }
    
    state_filter = super_trim(state_filter);
    if(state_filter != ''){
      filter_query += ' AND BillingState = :state_filter';
    }
    
    industry_filter = super_trim(industry_filter);
    if(industry_filter != ''){
      industry_filter = '%' + industry_filter + '%';
      filter_query += ' AND Industry LIKE :industry_filter';
    }
    
    if(filter_query.indexOf(' AND') == 0){
      filter_query = filter_query.substring(4);
      filter_query = ' WHERE'+filter_query;
    }
    
    //Sort
    String sort_query = '';
    
    switch on selected_sorting_order{
      when 'account_name_a_z'{
        sort_query = ' ORDER BY Name ASC, Name ASC';
      }
      when 'account_name_z_a'{
        sort_query = ' ORDER BY Name DESC, Name ASC';
      }
      when 'type_a_z'{
        sort_query = ' ORDER BY rodrigo__Type_Text__c ASC, Name ASC';
      }
      when 'type_z_a'{
        sort_query = ' ORDER BY rodrigo__Type_Text__c DESC, Name ASC';
      }
      when 'annual_revenue_0_9'{
        sort_query = ' ORDER BY AnnualRevenue ASC, Name ASC';
      }
      when 'annual_revenue_9_0'{
        sort_query = ' ORDER BY AnnualRevenue DESC, Name ASC';
      }
      when 'rating_a_z'{
        sort_query = ' ORDER BY rodrigo__Rating_Text__c ASC, Name ASC';
      }
      when 'rating_z_a'{
        sort_query = ' ORDER BY rodrigo__Rating_Text__c DESC, Name ASC';
      }
      when 'city_a_z'{
        sort_query = ' ORDER BY BillingCity ASC, Name ASC';
      }
      when 'city_z_a'{
        sort_query = ' ORDER BY BillingCity DESC, Name ASC';
      }
      when 'state_a_z'{
        sort_query = ' ORDER BY BillingState ASC, Name ASC';
      }
      when 'state_z_a'{
        sort_query = ' ORDER BY BillingState DESC, Name ASC';
      }
      when 'industry_a_z'{
        sort_query = ' ORDER BY rodrigo__Industry_Text__c ASC, Name ASC';
      }
      when 'industry_z_a'{
        sort_query = ' ORDER BY rodrigo__Industry_Text__c DESC, Name ASC';
      }
      when 'owner_name_a_z'{
        sort_query = ' ORDER BY Owner.Name ASC, Name ASC';
      }
      when 'owner_name_z_a'{
        sort_query = ' ORDER BY Owner.Name DESC, Name ASC';
      }
      when else{
        sort_query = ' ORDER BY LastViewedDate DESC NULLS LAST, Name ASC';
      }
    }
    
    //Pagination
    if(current_page < 1){
      current_page = 1;
    }
    if(records_per_page < 1){
      records_per_page = 1;
    }
    if(records_per_page > 500){
      records_per_page = 500;
    }
    
    Integer excluded_records = (current_page - 1) * records_per_page;
    if(excluded_records < 0){
      excluded_records = 0;
    }
    
    //Result
    AccountsResult result = new AccountsResult();
    result.types = apex_get_types();
    result.ratings = apex_get_ratings();
    result.accounts = new List<Account>();
    result.last_page = 0;
    
    String query = 'SELECT Id, Name, Type, AnnualRevenue, Rating, Website, BillingCity';
    query += ', BillingState, Industry, Owner.Id, Owner.Name, (SELECT rodrigo__CustomerTag__r.Id';
    query += ', rodrigo__CustomerTag__r.Name, rodrigo__CustomerTag__r.rodrigo__Color__c FROM rodrigo__CustomerTagsList__r';
    query += ' ORDER BY rodrigo__CustomerTag__r.Name) FROM Account';
    
    if(filter_query != ''){
      query += filter_query;
    }
    query += sort_query;
    query += ' LIMIT :records_per_page OFFSET :excluded_records';
    
    try{
      result.accounts = Database.query(query, AccessLevel.USER_MODE);
    }catch(Exception error){
      System.debug('Apex Error 001: ' + error.getMessage());
    }
    
    Integer total = 0;
    query = 'SELECT COUNT() FROM Account';
    if(filter_query != ''){
      query += filter_query;
    }
    
    try{
      total = Database.countQuery(query, AccessLevel.USER_MODE);
    }catch(Exception error){
      System.debug('Apex Error 002: ' + error.getMessage());
      total = 0;
    }
    
    Decimal division = Decimal.valueOf(total) / Decimal.valueOf(records_per_page);
    result.last_page = Integer.valueOf(Math.ceil(division));
    
    return result;
  }
  
  //Conversions
  private static String super_trim(String text){
    if(String.isNotBlank(text)){
      return text.trim().replaceAll('\\s+', ' ');
    }
    return '';
  }
  private static Long convert_annual_revenue(String text){
    text = super_trim(text);
    try{
      text = text.replace(',', '');
      text = text.replace('.', '');
      return Long.valueOf(text);
    }catch(System.Exception error){
      return null;
    }
  }
  
  //Types
  private static List<Map<String, String>> apex_get_types(){
    List<Map<String, String>> types = new List<Map<String, String>>();
    Schema.DescribeFieldResult field_result = Account.Type.getDescribe();
    List<Schema.PicklistEntry> picklist_entries = field_result.getPicklistValues();
    
    for(Schema.PicklistEntry entry : picklist_entries){
      if(entry.isActive()){
        Map<String, String> type = new Map<String, String>();
        type.put('value', entry.getValue());
        type.put('label', entry.getLabel());
        types.add(type);
      }
    }
    
    return types;
  }
  
  //Ratings
  private static List<Map<String, String>> apex_get_ratings(){
    List<Map<String, String>> ratings = new List<Map<String, String>>();
    Schema.DescribeFieldResult field_result = Account.Rating.getDescribe();
    List<Schema.PicklistEntry> picklist_entries = field_result.getPicklistValues();
    
    for(Schema.PicklistEntry entry : picklist_entries){
      if(entry.isActive()){
        Map<String, String> rating = new Map<String, String>();
        rating.put('value', entry.getValue());
        rating.put('label', entry.getLabel());
        ratings.add(rating);
      }
    }
    
    return ratings;
  }
  
  //Show Available Tags
  @AuraEnabled
  public static AvailableTagsResult aura_show_available_tags(String account_id){
    //Result
    AvailableTagsResult result = new AvailableTagsResult();
    result.account_id = '';
    result.account_name = '';
    result.available_tags = new List<CustomerTag__c>();
    
    String query = 'SELECT Id, Name FROM Account WHERE Id = :account_id';
    try{
      List<Account> accounts = (List<Account>) Database.query(query, AccessLevel.USER_MODE);
      
      if(accounts.size() > 0){
        result.account_id = accounts[0].Id;
        result.account_name = accounts[0].Name;
      }
    }catch(Exception error){
      System.debug('Apex Error 003: ' + error.getMessage());
    }
    
    query = 'SELECT Id, Name, rodrigo__Color__c FROM rodrigo__CustomerTag__c';
    query += ' WHERE Id NOT IN (SELECT rodrigo__CustomerTag__c FROM rodrigo__CustomerTagAssignment__c';
    query += ' WHERE rodrigo__Account__c = :account_id) ORDER BY Name';
    try{
      result.available_tags = Database.query(query, AccessLevel.USER_MODE);
    }catch(Exception error){
      System.debug('Apex Error 004: ' + error.getMessage());
    }
    
    return result;
  }
  
  //Assign Tag
  @AuraEnabled
  public static String aura_assign_tag(String account_id, String tag_id){
    if(!Schema.sObjectType.CustomerTagAssignment__c.isCreateable() 
       || !Schema.sObjectType.CustomerTagAssignment__c.fields.Account__c.isCreateable() 
       || !Schema.sObjectType.CustomerTagAssignment__c.fields.CustomerTag__c.isCreateable()){
      return 'You do not have permissions to assign tag.';
    }
    
    Account account = new Account();
    CustomerTag__c tag = new CustomerTag__c();
    CustomerTagAssignment__c assign = null;
    
    //Select Account
    String query = 'SELECT Id, Name FROM Account WHERE Id = :account_id LIMIT 1';
    try{
      account = Database.query(query, AccessLevel.USER_MODE);
    }catch(Exception error){
      System.debug('Apex Error 005: ' + error.getMessage());
      return 'The specified account was not found in the database.';
    }
    
    //Select Customer Tag
    query = 'SELECT Id, Name FROM rodrigo__CustomerTag__c WHERE Id = :tag_id LIMIT 1';
    try{
      tag = Database.query(query, AccessLevel.USER_MODE);
    }catch(Exception error){
      System.debug('Apex Error 006: ' + error.getMessage());
      return 'The specified tag was not found in the database.';
    }
    
    //Select Assign
    query = 'SELECT Id FROM rodrigo__CustomerTagAssignment__c WHERE rodrigo__Account__c = :account_id';
    query += ' AND rodrigo__CustomerTag__c = :tag_id LIMIT 1';
    try{
      assign = Database.query(query, AccessLevel.USER_MODE);
    }catch(Exception error){
      System.debug('Apex Error 007: ' + error.getMessage());
    }
    if(assign != null){
      return 'The assignment had already been made.';
    }
    
    //Insert
    assign = new CustomerTagAssignment__c(
      Account__c = account.Id,
      CustomerTag__c = tag.Id
    );
    
    try{
      insert as user assign;
    }catch(Exception error){
      System.debug('Apex Error 008: ' + error.getMessage());
      return 'The tag was not assigned due to an error, please refresh the page and try again.';
    }
    
    return 'Assign complete.';
  }
  
  @AuraEnabled
  public static TagToBeUnassignResult aura_show_tag_to_be_unassign(String account_id, String tag_id){
    //Result
    TagToBeUnassignResult result = new TagToBeUnassignResult();
    result.account_id = '';
    result.account_name = '';
    result.tag_id = '';
    result.tag_name = '';
    result.tag_color = '';
    
    String query = 'SELECT Id, Name FROM Account WHERE Id = :account_id';
    try{
      List<Account> accounts = (List<Account>) Database.query(query, AccessLevel.USER_MODE);
      
      if(accounts.size() > 0){
        result.account_id = accounts[0].Id;
        result.account_name = accounts[0].Name;
      }
    }catch(Exception error){
      System.debug('Apex Error 009: ' + error.getMessage());
    }
    
    query = 'SELECT Id, Name, rodrigo__Color__c FROM rodrigo__CustomerTag__c WHERE Id = :tag_id';
    try{
      List<CustomerTag__c> tags = (List<CustomerTag__c>) Database.query(query, AccessLevel.USER_MODE);
      
      if(tags.size() > 0){
        result.tag_id = tags[0].Id;
        result.tag_name = tags[0].Name;
        result.tag_color = tags[0].Color__c;
      }
    }catch(Exception error){
      System.debug('Apex Error 010: ' + error.getMessage());
    }
    
    return result;
  }
  
  @AuraEnabled
  public static String aura_unassign_tag(String account_id, String tag_id){
    if(!Schema.sObjectType.CustomerTagAssignment__c.isDeletable()){
      return 'You do not have permission to unassign tag.';
    }
    
    CustomerTagAssignment__c assign = new CustomerTagAssignment__c();
    
    //Select Assign
    String query = 'SELECT Id FROM rodrigo__CustomerTagAssignment__c WHERE rodrigo__Account__c = :account_id';
    query += ' AND rodrigo__CustomerTag__c = :tag_id LIMIT 1';
    try{
      assign = Database.query(query, AccessLevel.USER_MODE);
    }catch(Exception error){
      System.debug('Apex Error 011: ' + error.getMessage());
      return 'The specified account and tag pair was not found in the database.';
    }
    
    //Delete
    try{
      delete as user assign;
    }catch(Exception error){
      System.debug('Apex Error 012: ' + error.getMessage());
      return 'The tag was not unassigned due to an error, please refresh the page and try again.';
    }
    
    return 'Unassign complete.';
  }
  
  //Show Tags
  @AuraEnabled
  public static TagsResult aura_show_tags(){
    //Result
    TagsResult result = new TagsResult();
    result.colors = apex_get_colors();
    result.tags = new List<CustomerTag__c>();
    
    String query = 'SELECT Id, Name, rodrigo__Color__c FROM rodrigo__CustomerTag__c ORDER BY Name ASC LIMIT 100';
    try{
      result.tags = Database.query(query, AccessLevel.USER_MODE);
    }catch(Exception error){
      System.debug('Apex Error 013: ' + error.getMessage());
    }
    
    return result;
  }
  
  //Colors
  private static List<Map<String, String>> apex_get_colors(){
    List<Map<String, String>> colors = new List<Map<String, String>>();
    Schema.DescribeFieldResult field_result = CustomerTag__c.Color__c.getDescribe();
    List<Schema.PicklistEntry> picklist_entries = field_result.getPicklistValues();
    
    for(Schema.PicklistEntry entry : picklist_entries){
      if(entry.isActive()){
        Map<String, String> rating = new Map<String, String>();
        rating.put('value', entry.getValue());
        rating.put('label', entry.getLabel());
        colors.add(rating);
      }
    }
    
    return colors;
  }
  
  //New Tag
  @AuraEnabled
  public static String aura_add_new_tag(String tag_name, String tag_color){
    if(!Schema.sObjectType.CustomerTag__c.isCreateable() 
       || !Schema.sObjectType.CustomerTag__c.fields.Name.isCreateable() 
       || !Schema.sObjectType.CustomerTag__c.fields.Color__c.isCreateable()){
      return 'You do not have permissions to create tag.';
    }
    
    //Validations
    tag_name = (tag_name ?? '').trim();
    if(tag_name == null || tag_name == ''){
      return 'The tag was not registered because the name field is mandatory.';
    }
    if(tag_name.length() > 30){
      return 'The tag name cannot exceed 30 characters.';
    }
    if(tag_name.contains('+')){
      return 'The plus symbol (+) is not allowed.';
    }
    
    tag_color = (tag_color ?? '').trim();
    if(tag_color == null || tag_color == ''){
      return 'The tag was not registered because the color field is mandatory.';
    }
    
    List<Map<String, String>> colors = apex_get_colors();
    Boolean allowed_color = false;
    for(Map<String, String> color : colors){
      if(tag_color == color.get('value')){
        allowed_color = true;
        break;
      }
    }
    if(!allowed_color){
      return 'The tag was not registered because the selected color value is not allowed.';
    }
    
    List<CustomerTag__c> tags = [SELECT Id FROM CustomerTag__c WHERE Name = :tag_name WITH USER_MODE];
    if(!tags.isEmpty()){
      return 'The tag was not registered because a tag with this name already exists.';
    }
    
    //Insert
    CustomerTag__c tag = new CustomerTag__c(
      Name = tag_name,
      Color__c = tag_color
    );
    
    try{
      insert as user tag;
    }catch(Exception error){
      System.debug('Apex Error 014: ' + error.getMessage());
      return 'The tag was not registered due to an error, please refresh the page and try again.';
    }
    
    return 'Registration complete.';
  }
  
  @AuraEnabled
  public static TagToBeDeletedResult aura_show_tag_to_be_deleted(String tag_id){
    //Result
    TagToBeDeletedResult result = new TagToBeDeletedResult();
    result.tag_id = '';
    result.tag_name = '';
    result.tag_color = '';
    
    String query = 'SELECT Id, Name, rodrigo__Color__c FROM rodrigo__CustomerTag__c WHERE Id = :tag_id';
    try{
      List<CustomerTag__c> tags = (List<CustomerTag__c>) Database.query(query, AccessLevel.USER_MODE);
      
      if(tags.size() > 0){
        result.tag_id = tags[0].Id;
        result.tag_name = tags[0].Name;
        result.tag_color = tags[0].Color__c;
      }
    }catch(Exception error){
      System.debug('Apex Error 015: ' + error.getMessage());
    }
    
    return result;
  }
  
  @AuraEnabled
  public static String aura_delete_tag(String tag_id){
    //Select Assigns
    List<CustomerTagAssignment__c> assigns = new List<CustomerTagAssignment__c>();
    String query = 'SELECT Id FROM rodrigo__CustomerTagAssignment__c WHERE rodrigo__CustomerTag__c = :tag_id';
    try{
      assigns = Database.query(query, AccessLevel.USER_MODE);
    }catch(Exception error){
      System.debug('Apex Error 016: ' + error.getMessage());
    }
    if(assigns.size() > 0){
      return 'The tag cannot be deleted because it is assigned to one or more accounts.';
    }
    
    //Select Tag
    CustomerTag__c tag = new CustomerTag__c();
    query = 'SELECT Id FROM rodrigo__CustomerTag__c WHERE Id = :tag_id LIMIT 1';
    try{
      tag = Database.query(query, AccessLevel.USER_MODE);
    }catch(Exception error){
      System.debug('Apex Error 017: ' + error.getMessage());
      return 'The specified tag was not found in the database.';
    }
    
    //Delete
    try{
      delete as user tag;
    }catch(Exception error){
      System.debug('Apex Error 018: ' + error.getMessage());
      return 'The tag was not deleted due to an error, please refresh the page and try again.';
    }
    
    return 'Deletion complete.';
  }
  
}
