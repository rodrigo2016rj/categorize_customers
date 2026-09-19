List<CustomerTagAssignment__c> assigns_list = [SELECT Id FROM CustomerTagAssignment__c];
delete assigns_list;

List<CustomerTag__c> tags_list = [SELECT Id FROM CustomerTag__c];
delete tags_list;
