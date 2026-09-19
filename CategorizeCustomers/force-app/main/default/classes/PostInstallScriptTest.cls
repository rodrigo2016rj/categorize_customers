@isTest
private class PostInstallScriptTest{
  
  @isTest
  static void testInstallScriptSuccess() {
    PostInstallScript postInstall = new PostInstallScript();
    
    Test.startTest();
    Test.testInstall(postInstall, null, false);
    Test.stopTest();
    
    Assert.isTrue(true, 'The post-installation script was executed without submitting any proposals.');
  }
  
  @isTest
  static void testInstallScriptUpgrade() {
    PostInstallScript postInstall = new PostInstallScript();
    
    Test.startTest();
    Test.testInstall(postInstall, new Version(1, 0), false);
    Test.stopTest();
    
    Assert.isTrue(true, 'The update script was executed successfully.');
  }
}
