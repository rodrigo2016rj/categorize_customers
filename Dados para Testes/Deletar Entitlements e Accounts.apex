List<Entitlement> entitlements_list = [SELECT Id FROM Entitlement];
delete entitlements_list;

List<Account> accounts_list = [SELECT Id FROM Account];
delete accounts_list;
