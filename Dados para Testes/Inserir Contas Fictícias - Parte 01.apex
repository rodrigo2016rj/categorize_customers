List<Account> accounts_list = new List<Account>();

Account account001 = new Account(
  Name = 'Fictitious Advertising Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious001.com',
  BillingState = 'SP',
  BillingCity = 'São Paulo',
  Industry = 'Advertising',
  AnnualRevenue = 20000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'helena@emailfalso.rds' LIMIT 1].Id
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
  AnnualRevenue = 500000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'paula@emailfalso.rds' LIMIT 1].Id
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
  AnnualRevenue = 300000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'igor@emailfalso.rds' LIMIT 1].Id
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
  AnnualRevenue = 150000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'artur@emailfalso.rds' LIMIT 1].Id
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
  AnnualRevenue = 25000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'claudia@emailfalso.rds' LIMIT 1].Id
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
  AnnualRevenue = 300000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'claudia@emailfalso.rds' LIMIT 1].Id
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
  AnnualRevenue = 200000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'veronica@emailfalso.rds' LIMIT 1].Id
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
  AnnualRevenue = 250000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'igor@emailfalso.rds' LIMIT 1].Id
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
  AnnualRevenue = 1000000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'rodrigo@emailfalso.rds' LIMIT 1].Id
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
  AnnualRevenue = 3000000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'igor@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account010);

Account account011 = new Account(
  Name = 'Fictitious Biotechnology Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious011.com',
  BillingState = 'DA',
  BillingCity = 'Doha',
  Industry = 'Biotechnology',
  AnnualRevenue = 500000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'rodrigo@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account011);

Account account012 = new Account(
  Name = 'Fictitious Brand Management Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious012.com',
  BillingState = 'AG',
  BillingCity = 'Ciudad del Este',
  Industry = 'Brand Management',
  AnnualRevenue = 80000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'paula@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account012);

Account account013 = new Account(
  Name = 'Fictitious Business Development Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious013.com',
  BillingState = 'OS',
  BillingCity = 'Osaka',
  Industry = 'Business Development',
  AnnualRevenue = 50000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'igor@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account013);

Account account014 = new Account(
  Name = 'Fictitious Business Intelligence Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious014.com',
  BillingState = 'CT',
  BillingCity = 'Barcelona',
  Industry = 'Business Intelligence',
  AnnualRevenue = 100000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'helena@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account014);

Account account015 = new Account(
  Name = 'Fictitious Chemicals Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious015.com',
  BillingState = 'TY',
  BillingCity = 'Tóquio',
  Industry = 'Chemicals',
  AnnualRevenue = 800000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'veronica@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account015);

Account account016 = new Account(
  Name = 'Fictitious Civil Engineering Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious016.com',
  BillingState = 'AB',
  BillingCity = 'Estocolmo',
  Industry = 'Civil Engineering',
  AnnualRevenue = 150000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'igor@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account016);

Account account017 = new Account(
  Name = 'Fictitious Cloud Computing Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious017.com',
  BillingState = 'CA',
  BillingCity = 'Los Angeles',
  Industry = 'Cloud Computing',
  AnnualRevenue = 300000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'artur@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account017);

Account account018 = new Account(
  Name = 'Fictitious Commercial Real Estate Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious018.com',
  BillingState = 'MZ',
  BillingCity = 'Varsóvia',
  Industry = 'Commercial Real Estate',
  AnnualRevenue = 200000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'rodrigo@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account018);

Account account019 = new Account(
  Name = 'Fictitious Compliance Company',
  Type = 'Other',
  Rating = 'Cold',
  Website = 'https://fictitious019.com',
  BillingState = 'DF',
  BillingCity = 'Brasília',
  Industry = 'Compliance',
  AnnualRevenue = 80000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'ronaldo@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account019);

Account account020 = new Account(
  Name = 'Fictitious Construction Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious020.com',
  BillingState = 'SC',
  BillingCity = 'Balneário Camboriú',
  Industry = 'Construction',
  AnnualRevenue = 150000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'rodrigo@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account020);

Account account021 = new Account(
  Name = 'Fictitious Consulting Company',
  Type = 'Reseller',
  Rating = 'Hot',
  Website = 'https://fictitious021.com',
  BillingState = 'SU',
  BillingCity = 'Seul',
  Industry = 'Consulting',
  AnnualRevenue = 100000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'igor@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account021);

Account account022 = new Account(
  Name = 'Fictitious Consumer Goods Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious022.com',
  BillingState = 'NY',
  BillingCity = 'Nova York',
  Industry = 'Consumer Goods',
  AnnualRevenue = 500000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'veronica@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account022);

Account account023 = new Account(
  Name = 'Fictitious Corporate Finance Company',
  Type = 'Investor',
  Rating = 'Warm',
  Website = 'https://fictitious023.com',
  BillingState = 'MI',
  BillingCity = 'Milão',
  Industry = 'Corporate Finance',
  AnnualRevenue = 150000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'igor@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account023);

Account account024 = new Account(
  Name = 'Fictitious Customer Success Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious024.com',
  BillingState = 'CAS',
  BillingCity = 'Casablanca',
  Industry = 'Customer Success',
  AnnualRevenue = 60000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'rodrigo@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account024);

Account account025 = new Account(
  Name = 'Fictitious Cybersecurity Company',
  Type = 'Partner',
  Rating = 'Cold',
  Website = 'https://fictitious025.com',
  BillingState = 'SP',
  BillingCity = 'São Paulo',
  Industry = 'Cybersecurity',
  AnnualRevenue = 150000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'ronaldo@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account025);

Account account026 = new Account(
  Name = 'Fictitious Data Science Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious026.com',
  BillingState = 'BU',
  BillingCity = 'Budapeste',
  Industry = 'Data Science',
  AnnualRevenue = 80000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'artur@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account026);

Account account027 = new Account(
  Name = 'Fictitious Design Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious027.com',
  BillingState = 'NY',
  BillingCity = 'Nova York',
  Industry = 'Design',
  AnnualRevenue = 50000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'helena@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account027);

Account account028 = new Account(
  Name = 'Fictitious Digital Marketing Company',
  Type = 'Competitor',
  Rating = 'Cold',
  Website = 'https://fictitious028.com',
  BillingState = 'BY',
  BillingCity = 'Munique',
  Industry = 'Digital Marketing',
  AnnualRevenue = 50000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'helena@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account028);

Account account029 = new Account(
  Name = 'Fictitious E-commerce Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious029.com',
  BillingState = 'WA',
  BillingCity = 'Seattle',
  Industry = 'E-commerce',
  AnnualRevenue = 200000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'sara@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account029);

Account account030 = new Account(
  Name = 'Fictitious Education Company',
  Type = 'Prospect',
  Rating = 'Hot',
  Website = 'https://fictitious030.com',
  BillingState = 'WC',
  BillingCity = 'Cidade do Cabo',
  Industry = 'Education',
  AnnualRevenue = 150000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'igor@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account030);

Account account031 = new Account(
  Name = 'Fictitious Electronics Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious031.com',
  BillingState = 'NSW',
  BillingCity = 'Sydney',
  Industry = 'Electronics',
  AnnualRevenue = 500000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'claudia@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account031);

Account account032 = new Account(
  Name = 'Fictitious Energy Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious032.com',
  BillingState = 'CA',
  BillingCity = 'Los Angeles',
  Industry = 'Energy',
  AnnualRevenue = 1000000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'igor@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account032);

Account account033 = new Account(
  Name = 'Fictitious Entertainment Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious033.com',
  BillingState = 'MD',
  BillingCity = 'Madri',
  Industry = 'Entertainment',
  AnnualRevenue = 200000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'sara@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account033);

Account account034 = new Account(
  Name = 'Fictitious Environmental Services Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious034.com',
  BillingState = 'OR',
  BillingCity = 'Portland',
  Industry = 'Environmental Services',
  AnnualRevenue = 100000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'daniel@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account034);

Account account035 = new Account(
  Name = 'Fictitious Event Planning Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious035.com',
  BillingState = 'NV',
  BillingCity = 'Las Vegas',
  Industry = 'Event Planning',
  AnnualRevenue = 50000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'daniel@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account035);

Account account036 = new Account(
  Name = 'Fictitious Facilities Management Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious036.com',
  BillingState = 'IL',
  BillingCity = 'Chicago',
  Industry = 'Facilities Management',
  AnnualRevenue = 150000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'igor@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account036);

Account account037 = new Account(
  Name = 'Fictitious Fashion Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious037.com',
  BillingState = 'FL',
  BillingCity = 'Miami',
  Industry = 'Fashion',
  AnnualRevenue = 250000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'sara@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account037);

Account account038 = new Account(
  Name = 'Fictitious Financial Planning Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious038.com',
  BillingState = 'SL',
  BillingCity = 'Salzburgo',
  Industry = 'Financial Planning',
  AnnualRevenue = 50000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'claudia@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account038);

Account account039 = new Account(
  Name = 'Fictitious Fintech Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious039.com',
  BillingState = 'SP',
  BillingCity = 'São Paulo',
  Industry = 'Fintech',
  AnnualRevenue = 300000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'sara@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account039);

Account account040 = new Account(
  Name = 'Fictitious Food & Beverage Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious040.com',
  BillingState = 'GA',
  BillingCity = 'Atlanta',
  Industry = 'Food & Beverage',
  AnnualRevenue = 150000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'veronica@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account040);

Account account041 = new Account(
  Name = 'Fictitious Franchising Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious041.com',
  BillingState = 'TX',
  BillingCity = 'Dallas',
  Industry = 'Franchising',
  AnnualRevenue = 150000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'veronica@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account041);

Account account042 = new Account(
  Name = 'Fictitious Gaming Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious042.com',
  BillingState = 'NCR',
  BillingCity = 'Manila',
  Industry = 'Gaming',
  AnnualRevenue = 150000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'paula@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account042);

Account account043 = new Account(
  Name = 'Fictitious Gem Cutting Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious043.com',
  BillingState = 'MH',
  BillingCity = 'Mumbai',
  Industry = 'Gem Cutting',
  AnnualRevenue = 30000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'paula@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account043);

Account account044 = new Account(
  Name = 'Fictitious Government Relations Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious044.com',
  BillingState = 'BE',
  BillingCity = 'Berlim',
  Industry = 'Government Relations',
  AnnualRevenue = 40000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'sara@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account044);

Account account045 = new Account(
  Name = 'Fictitious Graphic Design Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious045.com',
  BillingState = 'RJ',
  BillingCity = 'Rio de Janeiro',
  Industry = 'Graphic Design',
  AnnualRevenue = 15000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'claudia@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account045);

Account account046 = new Account(
  Name = 'Fictitious Growth Marketing Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious046.com',
  BillingState = 'IDF',
  BillingCity = 'Paris',
  Industry = 'Growth Marketing',
  AnnualRevenue = 45000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'rodrigo@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account046);

Account account047 = new Account(
  Name = 'Fictitious Healthcare Company',
  Type = 'Prospect',
  Rating = 'Warm',
  Website = 'https://fictitious047.com',
  BillingState = 'CEB',
  BillingCity = 'Cebu',
  Industry = 'Healthcare',
  AnnualRevenue = 300000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'veronica@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account047);

Account account048 = new Account(
  Name = 'Fictitious Hospitality Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious048.com',
  BillingState = 'FL',
  BillingCity = 'Orlando',
  Industry = 'Hospitality',
  AnnualRevenue = 150000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'paula@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account048);

Account account049 = new Account(
  Name = 'Fictitious Human Resources Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious049.com',
  BillingState = 'BS',
  BillingCity = 'Busan',
  Industry = 'Human Resources',
  AnnualRevenue = 100000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'daniel@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account049);

Account account050 = new Account(
  Name = 'Fictitious Information Technology Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious050.com',
  BillingState = 'TA',
  BillingCity = 'Tel Aviv',
  Industry = 'Information Technology',
  AnnualRevenue = 250000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'paula@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account050);

insert accounts_list;
