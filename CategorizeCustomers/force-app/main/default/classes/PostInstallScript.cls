@SuppressWarnings('PMD.ApexSharingViolations')
public without sharing class PostInstallScript implements InstallHandler{
  public void onInstall(InstallContext context){
    if(context.isUpgrade() == false){
      PermissionSet permission_set = null;
      
      try{
        permission_set = [SELECT Id FROM PermissionSet WHERE Name = 'CategorizeCustomers' LIMIT 1];
        Id installer_id = context.installerId();
        
        PermissionSetAssignment assignment = new PermissionSetAssignment(
          AssigneeId = installer_id,
          PermissionSetId = permission_set.Id
        );
        
        if(Schema.sObjectType.PermissionSetAssignment.isCreateable() 
           && Schema.sObjectType.PermissionSetAssignment.fields.AssigneeId.isCreateable() 
           && Schema.sObjectType.PermissionSetAssignment.fields.PermissionSetId.isCreateable()){
          insert assignment;
        }else{
          System.debug('Install Error 001: Insufficient permissions to create PermissionSetAssignment.');
        }
        
      }catch(Exception error){
        System.debug('Install Error 002: ' + error.getMessage());
      }
      
      if(permission_set != null){
        setupStandardFieldPermissions(permission_set.Id);
      }else{
        System.debug('Install Error 003: Cannot execute field permissions because PermissionSet was not found.');
      }
    }
  }

  @TestVisible
  private static void setupStandardFieldPermissions(Id permission_set_id) {
    try {
      List<String> fields = new List<String>{
        'Account.Type',
        'Account.AnnualRevenue',
        'Account.Rating',
        'Account.Website',
        'Account.Industry'
      };
      
      Set<String> fields_that_already_have_permission = new Set<String>();
      List<FieldPermissions> field_permissions_list  = [SELECT Field FROM FieldPermissions WHERE ParentId = :permission_set_id AND SobjectType = 'Account'];
      for(FieldPermissions field_permissions : field_permissions_list){
        fields_that_already_have_permission.add(field_permissions.Field);
      }
      
      List<FieldPermissions> field_permission_to_insert = new List<FieldPermissions>();
      
      for(String field : fields){
        if(fields_that_already_have_permission.contains(field)){
          continue;
        }
        field_permission_to_insert.add(new FieldPermissions(
          ParentId = permission_set_id,
          SobjectType = 'Account',
          Field = field,
          PermissionsRead = true,
          PermissionsEdit = false
        ));
      }
      
      if(!field_permission_to_insert.isEmpty()){
        if(!Test.isRunningTest()){
          insert field_permission_to_insert;
        }
      }
    } catch(Exception error){
      System.debug('Install Error 004: ' + error.getMessage());
    }
  }
}
