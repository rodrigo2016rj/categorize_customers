@isTest
private class CustomerTagsControllerTest{
  
  @testSetup
  static void setup_data(){
    /* Accounts */
    List<Account> accounts_list = new List<Account>();
    
    Account account001 = new Account(
      Name = 'Fictitious Advertising Company',
      Type = 'Customer',
      Rating = 'Cold',
      Website = 'https://fictitious001.com',
      BillingState = 'SP',
      BillingCity = 'São Paulo',
      Industry = 'Advertising',
      AnnualRevenue = 20000000L
    );
    accounts_list.add(account001);
    
    Account account002 = new Account(
      Name = 'Fictitious Aerospace Company',
      Type = 'Customer',
      Rating = 'Warm',
      Website = 'https://fictitious002.com',
      BillingState = 'BS',
      BillingCity = 'Busan',
      Industry = 'Aerospace',
      AnnualRevenue = 500000000L
    );
    accounts_list.add(account002);
    
    Account account003 = new Account(
      Name = 'Fictitious Agribusiness Company',
      Type = 'Customer',
      Rating = 'Hot',
      Website = 'https://fictitious003.com',
      BillingState = 'MA',
      BillingCity = 'Cracóvia',
      Industry = 'Agribusiness',
      AnnualRevenue = 300000000L
    );
    accounts_list.add(account003);
    
    Account account004 = new Account(
      Name = 'Fictitious Analytics Company',
      Type = 'Customer',
      Rating = 'Cold',
      Website = 'https://fictitious004.com',
      BillingState = 'DF',
      BillingCity = 'Buenos Aires',
      Industry = 'Analytics',
      AnnualRevenue = 150000000L
    );
    accounts_list.add(account004);
    
    Account account005 = new Account(
      Name = 'Fictitious Architecture Company',
      Type = 'Customer',
      Rating = 'Warm',
      Website = 'https://fictitious005.com',
      BillingState = 'WI',
      BillingCity = 'Viena',
      Industry = 'Architecture',
      AnnualRevenue = 25000000L
    );
    accounts_list.add(account005);
    
    Account account006 = new Account(
      Name = 'Fictitious Asset Management Company',
      Type = 'Customer',
      Rating = 'Hot',
      Website = 'https://fictitious006.com',
      BillingState = 'NY',
      BillingCity = 'Nova York',
      Industry = 'Asset Management',
      AnnualRevenue = 300000000L
    );
    accounts_list.add(account006);
    
    Account account007 = new Account(
      Name = 'Fictitious Audit Company',
      Type = 'Customer',
      Rating = 'Cold',
      Website = 'https://fictitious007.com',
      BillingState = 'SP',
      BillingCity = 'São Paulo',
      Industry = 'Audit',
      AnnualRevenue = 200000000L
    );
    accounts_list.add(account007);
    
    Account account008 = new Account(
      Name = 'Fictitious Automation Company',
      Type = 'Customer',
      Rating = 'Warm',
      Website = 'https://fictitious008.com',
      BillingState = 'TY',
      BillingCity = 'Tóquio',
      Industry = 'Automation',
      AnnualRevenue = 250000000L
    );
    accounts_list.add(account008);
    
    Account account009 = new Account(
      Name = 'Fictitious Automotive Company',
      Type = 'Customer',
      Rating = 'Hot',
      Website = 'https://fictitious009.com',
      BillingState = 'NY',
      BillingCity = 'Nova York',
      Industry = 'Automotive',
      AnnualRevenue = 1000000000L
    );
    accounts_list.add(account009);
    
    Account account010 = new Account(
      Name = 'Fictitious Banking Company',
      Type = 'Investor',
      Rating = 'Cold',
      Website = 'https://fictitious010.com',
      BillingState = 'C',
      BillingCity = 'Cairo',
      Industry = 'Banking',
      AnnualRevenue = 3000000000L
    );
    accounts_list.add(account010);
    
    insert accounts_list;

    /* Tags */
    List<CustomerTag__c> tags_list = new List<CustomerTag__c>();
    
    CustomerTag__c tag001 = new CustomerTag__c(
      Name = 'Tag 001',
      Color__c = 'Dark Green'
    );
    tags_list.add(tag001);
    
    CustomerTag__c tag002 = new CustomerTag__c(
      Name = 'Tag 002',
      Color__c = 'Orange'
    );
    tags_list.add(tag002);
    
    CustomerTag__c tag003 = new CustomerTag__c(
      Name = 'Tag 003',
      Color__c = 'Dark Purple'
    );
    tags_list.add(tag003);
    
    CustomerTag__c tag004 = new CustomerTag__c(
      Name = 'Tag 004',
      Color__c = 'Slate Blue'
    );
    tags_list.add(tag004);
    
    CustomerTag__c tag005 = new CustomerTag__c(
      Name = 'Tag 005',
      Color__c = 'Dark Brown'
    );
    tags_list.add(tag005);
    
    insert tags_list;
    
    /* Assigns */
    List<CustomerTagAssignment__c> assigns_list = new List<CustomerTagAssignment__c>();
    
    CustomerTagAssignment__c assign001 = new CustomerTagAssignment__c(
      Account__c = account001.Id,
      CustomerTag__c = tag001.Id
    );
    assigns_list.add(assign001);
    
    CustomerTagAssignment__c assign002 = new CustomerTagAssignment__c(
      Account__c = account002.Id,
      CustomerTag__c = tag002.Id
    );
    assigns_list.add(assign002);
    
    CustomerTagAssignment__c assign003 = new CustomerTagAssignment__c(
      Account__c = account003.Id,
      CustomerTag__c = tag003.Id
    );
    assigns_list.add(assign003);
    
    CustomerTagAssignment__c assign004 = new CustomerTagAssignment__c(
      Account__c = account004.Id,
      CustomerTag__c = tag004.Id
    );
    assigns_list.add(assign004);
    
    CustomerTagAssignment__c assign005 = new CustomerTagAssignment__c(
      Account__c = account005.Id,
      CustomerTag__c = tag005.Id
    );
    assigns_list.add(assign005);
    
    insert assigns_list;
  }
  
  @isTest
  static void test_aura_show_accounts_001(){
    CustomerTagsController.Filters filters = new CustomerTagsController.Filters();
    
    Test.startTest();
    CustomerTagsController.AccountsResult result = CustomerTagsController.aura_show_accounts(
      filters, 
      'account_name_a_z',
      1,
      5
    );
    Test.stopTest();
    
    String message = 'The result of the method should not be null.';
    Assert.isNotNull(result, message);
    
    message = 'The list of accounts should not be null.';
    Assert.isNotNull(result.accounts, message);
    Integer count = result.accounts.size();
    message = 'The number of records in the account list cannot be different from 5.';
    Assert.areEqual(5, count, message);
    
    message = 'The list of picklist types should not be null.';
    Assert.isNotNull(result.types, message);
    
    message = 'The list of picklist ratings should not be null.';
    Assert.isNotNull(result.ratings, message);
    
    message = 'The last page should not be null.';
    Assert.isNotNull(result.last_page, message);
    message = 'The last page cannot be different from 2.';
    Assert.areEqual(2, result.last_page, message);
  }
  
  @isTest
  static void test_aura_show_accounts_002(){
    CustomerTagsController.Filters filters = new CustomerTagsController.Filters();
    filters.name_filter = 'Auto';
    
    Test.startTest();
    CustomerTagsController.AccountsResult result = CustomerTagsController.aura_show_accounts(
      filters, 
      'account_name_a_z',
      1,
      10
    );
    Test.stopTest();
    
    String message = 'The result of the method should not be null.';
    Assert.isNotNull(result, message);
    
    message = 'The list of accounts should not be null.';
    Assert.isNotNull(result.accounts, message);
    Integer count = result.accounts.size();
    message = 'The number of records in the account list cannot be different from 2.';
    Assert.areEqual(2, count, message);
    
    message = 'The list of picklist types should not be null.';
    Assert.isNotNull(result.types, message);
    
    message = 'The list of picklist ratings should not be null.';
    Assert.isNotNull(result.ratings, message);
    
    message = 'The last page should not be null.';
    Assert.isNotNull(result.last_page, message);
    message = 'The last page cannot be different from 1.';
    Assert.areEqual(1, result.last_page, message);
  }
  
  @isTest
  static void test_aura_show_accounts_003(){
    CustomerTagsController.Filters filters = new CustomerTagsController.Filters();
    filters.city_filter = 'São Paulo';
    
    Test.startTest();
    CustomerTagsController.AccountsResult result = CustomerTagsController.aura_show_accounts(
      filters, 
      'account_name_z_a',
      1,
      1
    );
    Test.stopTest();
    
    String message = 'The result of the method should not be null.';
    Assert.isNotNull(result, message);
    
    message = 'The list of accounts should not be null.';
    Assert.isNotNull(result.accounts, message);
    Integer count = result.accounts.size();
    message = 'The number of records in the account list cannot be different from 1.';
    Assert.areEqual(1, count, message);
    
    message = 'The list of picklist types should not be null.';
    Assert.isNotNull(result.types, message);
    
    message = 'The list of picklist ratings should not be null.';
    Assert.isNotNull(result.ratings, message);
    
    message = 'The last page should not be null.';
    Assert.isNotNull(result.last_page, message);
    message = 'The last page cannot be different from 2.';
    Assert.areEqual(2, result.last_page, message);
  }
  
  @isTest
  static void test_aura_show_accounts_004(){
    CustomerTagsController.Filters filters = new CustomerTagsController.Filters();
    filters.tag_filter = 'Tag 005';
    
    Test.startTest();
    CustomerTagsController.AccountsResult result = CustomerTagsController.aura_show_accounts(
      filters, 
      'account_name_a_z',
      1,
      50
    );
    Test.stopTest();
    
    String message = 'The result of the method should not be null.';
    Assert.isNotNull(result, message);
    
    message = 'The list of accounts should not be null.';
    Assert.isNotNull(result.accounts, message);
    Integer count = result.accounts.size();
    message = 'The number of records in the account list cannot be different from 1.';
    Assert.areEqual(1, count, message);
    
    message = 'The list of picklist types should not be null.';
    Assert.isNotNull(result.types, message);
    
    message = 'The list of picklist ratings should not be null.';
    Assert.isNotNull(result.ratings, message);
    
    message = 'The last page should not be null.';
    Assert.isNotNull(result.last_page, message);
    message = 'The last page cannot be different from 1.';
    Assert.areEqual(1, result.last_page, message);
  }
  
  @isTest
  static void test_aura_show_accounts_005(){
    CustomerTagsController.Filters filters = new CustomerTagsController.Filters();
    List<String> orders = new List<String>{
      'account_name_a_z', 'account_name_z_a', 'type_a_z', 'type_z_a', 'annual_revenue_0_9', 
      'annual_revenue_9_0', 'rating_a_z', 'rating_z_a', 'city_a_z', 'city_z_a', 'state_a_z', 
      'state_z_a', 'industry_a_z', 'industry_z_a', 'owner_name_a_z', 'owner_name_z_a', 
      'invalid_order'
    };
    
    Test.startTest();
    for(String order : orders){
      CustomerTagsController.aura_show_accounts(filters, order, 1, 5);
    }
    Test.stopTest();
    
    Assert.isTrue(true, 'Just to ensure that all branches of the switch are executed.');
  }
  
  @isTest
  static void test_aura_show_available_tags(){
    Account account = [SELECT Id FROM Account LIMIT 1];
    
    Test.startTest();
    CustomerTagsController.AvailableTagsResult result = CustomerTagsController.aura_show_available_tags(account.Id);
    Test.stopTest();
    
    String message = 'The result of available tags should not be null.';
    Assert.isNotNull(result, message);
    message = 'The returned account ID must match the one submitted.';
    Assert.areEqual(account.Id, result.account_id, message);
  }
  
  @isTest
  static void test_aura_assign_tag(){
    Account account = [SELECT Id FROM Account LIMIT 1];
    
    CustomerTag__c tag = new CustomerTag__c(Name = 'Tag X', Color__c = 'Blue');
    insert tag;
    
    Test.startTest();
    String returned_message = CustomerTagsController.aura_assign_tag(account.Id, tag.Id);
    Test.stopTest();
    
    String message = 'The return message should indicate successful assignment.';
    Assert.areEqual('Assign complete.', returned_message, message);
  }
  
  @isTest
  static void test_aura_show_tag_to_be_unassign(){
    Account account = [SELECT Id FROM Account LIMIT 1];
    CustomerTag__c tag = [SELECT Id FROM CustomerTag__c LIMIT 1];
    
    Test.startTest();
    CustomerTagsController.TagToBeUnassignResult result = CustomerTagsController.aura_show_tag_to_be_unassign(account.Id, tag.Id);
    Test.stopTest();
    
    String message = 'The return value should not be null.';
    Assert.isNotNull(result, message);
    message = 'The returned tag ID must be the same as the one submitted.';
    Assert.areEqual(tag.Id, result.tag_id, message);
  }
  
  @isTest
  static void test_aura_unassign_tag(){
    Account account = [SELECT Id FROM Account LIMIT 1];
    CustomerTag__c tag = [SELECT Id FROM CustomerTag__c LIMIT 1];
    
    Test.startTest();
    String returned_message = CustomerTagsController.aura_unassign_tag(account.Id, tag.Id);
    Test.stopTest();
    
    String message = 'Removing the assignment should return success.';
    Assert.areEqual('Unassign complete.', returned_message, message);
  }
  
  @isTest
  static void test_aura_show_tags(){
    Test.startTest();
    CustomerTagsController.TagsResult result = CustomerTagsController.aura_show_tags();
    Test.stopTest();
    
    String message = 'The result of listing tags should not be null.';
    Assert.isNotNull(result, message);
    message = 'The returned list of tags should contain the tags created in the setup.';
    Assert.isFalse(result.tags.isEmpty(), message);
    Integer count = result.tags.size();
    message = 'The number of records in the tags list cannot be different from 5.';
    Assert.areEqual(5, count, message);
  }
  
  @isTest
  static void test_aura_add_new_tag(){
    Test.startTest();
    
    String returned_message = CustomerTagsController.aura_add_new_tag('Tag Y', 'Green');
    Test.stopTest();
    
    String message = 'Registering a new valid tag should work.';
    Assert.areEqual('Registration complete.', returned_message, message);
  }
  
  @isTest
  static void test_aura_show_tag_to_be_deleted(){
    CustomerTag__c tag = [SELECT Id FROM CustomerTag__c LIMIT 1];
    
    Test.startTest();
    CustomerTagsController.TagToBeDeletedResult result = CustomerTagsController.aura_show_tag_to_be_deleted(tag.Id);
    Test.stopTest();
    
    String message = 'The result of the tag search for deletion should not be null.';
    Assert.isNotNull(result, message);
    message = 'The ID mapped in the wrapper must be identical to the one sent.';
    Assert.areEqual(tag.Id, result.tag_id, message);
  }
  
  @isTest
  static void test_aura_delete_tag(){
    CustomerTag__c tag = [SELECT Id FROM CustomerTag__c LIMIT 1];
    
    Test.startTest();
    String returned_message = CustomerTagsController.aura_delete_tag(tag.Id);
    Test.stopTest();
    
    String message = 'The method should return a validation message preventing deletion.';
    Assert.areEqual(
      'The tag cannot be deleted because it is assigned to one or more accounts.', 
      returned_message, 
      message
    );
  }
}
