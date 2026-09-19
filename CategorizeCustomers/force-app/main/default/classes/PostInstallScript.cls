public class PostInstallScript implements InstallHandler{
  public void onInstall(InstallContext context){
    if(context.isUpgrade() == false){
      try{
        PermissionSet permission_set = [SELECT Id FROM PermissionSet WHERE Name = 'CategorizeCustomers' LIMIT 1];
        Id installer_id = context.installerId();
        
        PermissionSetAssignment assignment = new PermissionSetAssignment(
          AssigneeId = installer_id,
          PermissionSetId = permission_set.Id
        );
        
        insert assignment;
      }catch(Exception error){
        System.debug('Install Error 001: ' + error.getMessage());
      }
    }
  }
}
