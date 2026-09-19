List<User> users_list = new List<User>();

Profile profile = [SELECT Id FROM Profile WHERE Name = 'Identity User' LIMIT 1];

User user001 = new User(
  FirstName = 'Rodrigo',
  LastName = 'Diniz da Silva Fictício',
  Alias = 'Rodrigo',
  Email = 'rodrigo@emailfalso.rds',
  Username = 'rodrigo@emailfalso.rds',
  ProfileId = profile.Id,
  TimeZoneSidKey = 'America/Sao_Paulo',
  LocaleSidKey = 'pt_BR',
  EmailEncodingKey = 'UTF-8',
  LanguageLocaleKey = 'pt_BR'
);
users_list.add(user001);

User user002 = new User(
  FirstName = 'Cláudia',
  LastName = 'Diniz da Silva Fictícia',
  Alias = 'Cláudia',
  Email = 'claudia@emailfalso.rds',
  Username = 'claudia@emailfalso.rds',
  ProfileId = profile.Id,
  TimeZoneSidKey = 'America/Sao_Paulo',
  LocaleSidKey = 'pt_BR',
  EmailEncodingKey = 'UTF-8',
  LanguageLocaleKey = 'pt_BR'
);
users_list.add(user002);

User user003 = new User(
  FirstName = 'Artur',
  LastName = 'Diniz da Silva Fictício',
  Alias = 'Artur',
  Email = 'artur@emailfalso.rds',
  Username = 'artur@emailfalso.rds',
  ProfileId = profile.Id,
  TimeZoneSidKey = 'America/Sao_Paulo',
  LocaleSidKey = 'pt_BR',
  EmailEncodingKey = 'UTF-8',
  LanguageLocaleKey = 'pt_BR'
);
users_list.add(user003);

User user004 = new User(
  FirstName = 'Helena',
  LastName = 'Diniz da Silva Fictícia',
  Alias = 'Helena',
  Email = 'helena@emailfalso.rds',
  Username = 'helena@emailfalso.rds',
  ProfileId = profile.Id,
  TimeZoneSidKey = 'America/Sao_Paulo',
  LocaleSidKey = 'pt_BR',
  EmailEncodingKey = 'UTF-8',
  LanguageLocaleKey = 'pt_BR'
);
users_list.add(user004);

User user005 = new User(
  FirstName = 'Ronaldo',
  LastName = 'Diniz da Silva Fictício',
  Alias = 'Ronaldo',
  Email = 'ronaldo@emailfalso.rds',
  Username = 'ronaldo@emailfalso.rds',
  ProfileId = profile.Id,
  TimeZoneSidKey = 'America/Sao_Paulo',
  LocaleSidKey = 'pt_BR',
  EmailEncodingKey = 'UTF-8',
  LanguageLocaleKey = 'pt_BR'
);
users_list.add(user005);

User user006 = new User(
  FirstName = 'Sara',
  LastName = 'Diniz da Silva Fictícia',
  Alias = 'Sara',
  Email = 'sara@emailfalso.rds',
  Username = 'sara@emailfalso.rds',
  ProfileId = profile.Id,
  TimeZoneSidKey = 'America/Sao_Paulo',
  LocaleSidKey = 'pt_BR',
  EmailEncodingKey = 'UTF-8',
  LanguageLocaleKey = 'pt_BR'
);
users_list.add(user006);

User user007 = new User(
  FirstName = 'Igor',
  LastName = 'Diniz da Silva Fictício',
  Alias = 'Igor',
  Email = 'igor@emailfalso.rds',
  Username = 'igor@emailfalso.rds',
  ProfileId = profile.Id,
  TimeZoneSidKey = 'America/Sao_Paulo',
  LocaleSidKey = 'pt_BR',
  EmailEncodingKey = 'UTF-8',
  LanguageLocaleKey = 'pt_BR'
);
users_list.add(user007);

User user008 = new User(
  FirstName = 'Verônica',
  LastName = 'Diniz da Silva Fictícia',
  Alias = 'Verônica',
  Email = 'veronica@emailfalso.rds',
  Username = 'veronica@emailfalso.rds',
  ProfileId = profile.Id,
  TimeZoneSidKey = 'America/Sao_Paulo',
  LocaleSidKey = 'pt_BR',
  EmailEncodingKey = 'UTF-8',
  LanguageLocaleKey = 'pt_BR'
);
users_list.add(user008);

User user009 = new User(
  FirstName = 'Daniel',
  LastName = 'Diniz da Silva Fictício',
  Alias = 'Daniel',
  Email = 'daniel@emailfalso.rds',
  Username = 'daniel@emailfalso.rds',
  ProfileId = profile.Id,
  TimeZoneSidKey = 'America/Sao_Paulo',
  LocaleSidKey = 'pt_BR',
  EmailEncodingKey = 'UTF-8',
  LanguageLocaleKey = 'pt_BR'
);
users_list.add(user009);

User user010 = new User(
  FirstName = 'Paula',
  LastName = 'Diniz da Silva Fictícia',
  Alias = 'Paula',
  Email = 'paula@emailfalso.rds',
  Username = 'paula@emailfalso.rds',
  ProfileId = profile.Id,
  TimeZoneSidKey = 'America/Sao_Paulo',
  LocaleSidKey = 'pt_BR',
  EmailEncodingKey = 'UTF-8',
  LanguageLocaleKey = 'pt_BR'
);
users_list.add(user010);

insert users_list;
