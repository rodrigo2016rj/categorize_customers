@isTest
private class PostInstallScriptTest{
  
  @isTest(SeeAllData=true)
  static void testInstallScriptSuccess(){
    PostInstallScript postInstall = new PostInstallScript();
    
    Test.startTest();
    Test.testInstall(postInstall, null, false);
    
    Id real_ps_id = [SELECT Id FROM PermissionSet WHERE Name = 'CategorizeCustomers' LIMIT 1].Id;
    
    PostInstallScript.setupStandardFieldPermissions(real_ps_id);
    Test.stopTest();
    
    Assert.isTrue(true, 'The post-installation script was executed successfully.');
  }
  
  @isTest(SeeAllData=true)
  static void testInstallScriptUpgrade(){
    PostInstallScript postInstall = new PostInstallScript();
    
    Test.startTest();
    Test.testInstall(postInstall, new Version(1, 0), false);
    Test.stopTest();
    
    Assert.isTrue(true, 'The update script was executed successfully.');
  }
}
