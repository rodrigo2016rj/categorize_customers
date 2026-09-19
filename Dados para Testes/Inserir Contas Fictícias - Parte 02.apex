List<Account> accounts_list = new List<Account>();

Account account051 = new Account(
  Name = 'Fictitious Infrastructure Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious051.com',
  BillingState = 'TY',
  BillingCity = 'Tóquio',
  Industry = 'Infrastructure',
  AnnualRevenue = 800000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'artur@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account051);

Account account052 = new Account(
  Name = 'Fictitious Insurance Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious052.com',
  BillingState = 'RA',
  BillingCity = 'Al Rayyan',
  Industry = 'Insurance',
  AnnualRevenue = 500000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'helena@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account052);

Account account053 = new Account(
  Name = 'Fictitious Internal Audit Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious053.com',
  BillingState = 'NC',
  BillingCity = 'Charlotte',
  Industry = 'Internal Audit',
  AnnualRevenue = 60000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'igor@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account053);

Account account054 = new Account(
  Name = 'Fictitious International Trade Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious054.com',
  BillingState = 'ENG',
  BillingCity = 'Londres',
  Industry = 'International Trade',
  AnnualRevenue = 400000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'claudia@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account054);

Account account055 = new Account(
  Name = 'Fictitious Investment Banking Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious055.com',
  BillingState = 'NY',
  BillingCity = 'Nova York',
  Industry = 'Investment Banking',
  AnnualRevenue = 1000000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'sara@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account055);

Account account056 = new Account(
  Name = 'Fictitious Legal Services Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious056.com',
  BillingState = 'DC',
  BillingCity = 'Washington',
  Industry = 'Legal Services',
  AnnualRevenue = 40000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'claudia@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account056);

Account account057 = new Account(
  Name = 'Fictitious Logistics Company',
  Type = 'Partner',
  Rating = 'Hot',
  Website = 'https://fictitious057.com',
  BillingState = 'SP',
  BillingCity = 'São Paulo',
  Industry = 'Logistics',
  AnnualRevenue = 300000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'sara@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account057);

Account account058 = new Account(
  Name = 'Fictitious Luxury Goods Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious058.com',
  BillingState = 'TY',
  BillingCity = 'Tóquio',
  Industry = 'Luxury Goods',
  AnnualRevenue = 400000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'claudia@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account058);

Account account059 = new Account(
  Name = 'Fictitious Manufacturing Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious059.com',
  BillingState = 'ENG',
  BillingCity = 'Manchester',
  Industry = 'Manufacturing',
  AnnualRevenue = 400000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'igor@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account059);

Account account060 = new Account(
  Name = 'Fictitious Market Research Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious060.com',
  BillingState = 'SP',
  BillingCity = 'São Paulo',
  Industry = 'Market Research',
  AnnualRevenue = 80000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'paula@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account060);

Account account061 = new Account(
  Name = 'Fictitious Media Production Company',
  Type = 'Press',
  Rating = 'Cold',
  Website = 'https://fictitious061.com',
  BillingState = 'TY',
  BillingCity = 'Tóquio',
  Industry = 'Media Production',
  AnnualRevenue = 60000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'daniel@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account061);

Account account062 = new Account(
  Name = 'Fictitious Medical Devices Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious062.com',
  BillingState = 'ANT',
  BillingCity = 'Medellín',
  Industry = 'Medical Devices',
  AnnualRevenue = 400000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'claudia@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account062);

Account account063 = new Account(
  Name = 'Fictitious Mergers & Acquisitions Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious063.com',
  BillingState = 'OS',
  BillingCity = 'Osaka',
  Industry = 'Mergers & Acquisitions',
  AnnualRevenue = 200000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'ronaldo@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account063);

Account account064 = new Account(
  Name = 'Fictitious Mining Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious064.com',
  BillingState = 'DL',
  BillingCity = 'Nova Deli',
  Industry = 'Mining',
  AnnualRevenue = 800000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'sara@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account064);

Account account065 = new Account(
  Name = 'Fictitious Mobile Development Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious065.com',
  BillingState = 'ASU',
  BillingCity = 'Assunção',
  Industry = 'Mobile Development',
  AnnualRevenue = 80000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'paula@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account065);

Account account066 = new Account(
  Name = 'Fictitious Oil & Gas Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious066.com',
  BillingState = 'NI',
  BillingCity = 'Niigata',
  Industry = 'Oil & Gas',
  AnnualRevenue = 3000000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'artur@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account066);

Account account067 = new Account(
  Name = 'Fictitious Operations Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious067.com',
  BillingState = 'UL',
  BillingCity = 'Ulsan',
  Industry = 'Operations',
  AnnualRevenue = 120000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'igor@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account067);

Account account068 = new Account(
  Name = 'Fictitious Performance Marketing Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious068.com',
  BillingState = 'FK',
  BillingCity = 'Fukuoka',
  Industry = 'Performance Marketing',
  AnnualRevenue = 70000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'ronaldo@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account068);

Account account069 = new Account(
  Name = 'Fictitious Petrochemicals Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious069.com',
  BillingState = 'SP',
  BillingCity = 'São Paulo',
  Industry = 'Petrochemicals',
  AnnualRevenue = 3000000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'paula@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account069);

Account account070 = new Account(
  Name = 'Fictitious Pharmaceuticals Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious070.com',
  BillingState = 'VIC',
  BillingCity = 'Melbourne',
  Industry = 'Pharmaceuticals',
  AnnualRevenue = 1500000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'igor@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account070);

Account account071 = new Account(
  Name = 'Fictitious Product Management Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious071.com',
  BillingState = 'DC',
  BillingCity = 'Bogotá',
  Industry = 'Product Management',
  AnnualRevenue = 50000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'claudia@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account071);

Account account072 = new Account(
  Name = 'Fictitious Public Policy Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious072.com',
  BillingState = 'GP',
  BillingCity = 'Joanesburgo',
  Industry = 'Public Policy',
  AnnualRevenue = 50000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'rodrigo@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account072);

Account account073 = new Account(
  Name = 'Fictitious Public Relations Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious073.com',
  BillingState = 'ARA',
  BillingCity = 'Lyon',
  Industry = 'Public Relations',
  AnnualRevenue = 50000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'ronaldo@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account073);

Account account074 = new Account(
  Name = 'Fictitious Purchasing Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious074.com',
  BillingState = 'RM',
  BillingCity = 'Roma',
  Industry = 'Purchasing',
  AnnualRevenue = 80000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'helena@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account074);

Account account075 = new Account(
  Name = 'Fictitious Quality Assurance Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious075.com',
  BillingState = 'BRU',
  BillingCity = 'Bruxelas',
  Industry = 'Quality Assurance',
  AnnualRevenue = 80000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'artur@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account075);

Account account076 = new Account(
  Name = 'Fictitious Real Estate Company',
  Type = 'Prospect',
  Rating = 'Cold',
  Website = 'https://fictitious076.com',
  BillingState = 'SF',
  BillingCity = 'Rosário',
  Industry = 'Real Estate',
  AnnualRevenue = 250000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'daniel@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account076);

Account account077 = new Account(
  Name = 'Fictitious Renewable Energy Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious077.com',
  BillingState = 'HB',
  BillingCity = 'Debrecen',
  Industry = 'Renewable Energy',
  AnnualRevenue = 400000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'rodrigo@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account077);

Account account078 = new Account(
  Name = 'Fictitious Retail Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious078.com',
  BillingState = 'NY',
  BillingCity = 'Nova York',
  Industry = 'Retail',
  AnnualRevenue = 1000000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'daniel@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account078);

Account account079 = new Account(
  Name = 'Fictitious Risk Management Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious079.com',
  BillingState = 'IT',
  BillingCity = 'Encarnación',
  Industry = 'Risk Management',
  AnnualRevenue = 80000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'paula@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account079);

Account account080 = new Account(
  Name = 'Fictitious Sales Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious080.com',
  BillingState = 'SP',
  BillingCity = 'São Paulo',
  Industry = 'Sales',
  AnnualRevenue = 80000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'claudia@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account080);

Account account081 = new Account(
  Name = 'Fictitious Sales Operations Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious081.com',
  BillingState = 'VAL',
  BillingCity = 'Cali',
  Industry = 'Sales Operations',
  AnnualRevenue = 60000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'helena@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account081);

Account account082 = new Account(
  Name = 'Fictitious Securities Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious082.com',
  BillingState = 'OS',
  BillingCity = 'Osaka',
  Industry = 'Securities',
  AnnualRevenue = 1000000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'paula@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account082);

Account account083 = new Account(
  Name = 'Fictitious Social Media Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious083.com',
  BillingState = 'TY',
  BillingCity = 'Shibuya',
  Industry = 'Social Media',
  AnnualRevenue = 80000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'paula@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account083);

Account account084 = new Account(
  Name = 'Fictitious Software Engineering Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious084.com',
  BillingState = 'SP',
  BillingCity = 'São Paulo',
  Industry = 'Software Engineering',
  AnnualRevenue = 150000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'paula@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account084);

Account account085 = new Account(
  Name = 'Fictitious Strategic Planning Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious085.com',
  BillingState = 'TO',
  BillingCity = 'Turim',
  Industry = 'Strategic Planning',
  AnnualRevenue = 80000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'daniel@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account085);

Account account086 = new Account(
  Name = 'Fictitious Supply Chain Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious086.com',
  BillingState = 'HH',
  BillingCity = 'Hamburgo',
  Industry = 'Supply Chain',
  AnnualRevenue = 150000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'veronica@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account086);

Account account087 = new Account(
  Name = 'Fictitious Sustainability Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious087.com',
  BillingState = 'QLD',
  BillingCity = 'Brisbane',
  Industry = 'Sustainability',
  AnnualRevenue = 60000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'igor@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account087);

Account account088 = new Account(
  Name = 'Fictitious Taxation Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious088.com',
  BillingState = 'ALX',
  BillingCity = 'Alexandria',
  Industry = 'Taxation',
  AnnualRevenue = 80000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'artur@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account088);

Account account089 = new Account(
  Name = 'Fictitious Technology Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious089.com',
  BillingState = 'CA',
  BillingCity = 'Los Angeles',
  Industry = 'Technology',
  AnnualRevenue = 500000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'daniel@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account089);

Account account090 = new Account(
  Name = 'Fictitious Telecommunications Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious090.com',
  BillingState = 'CA',
  BillingCity = 'Los Angeles',
  Industry = 'Telecommunications',
  AnnualRevenue = 500000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'daniel@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account090);

Account account091 = new Account(
  Name = 'Fictitious Tourism Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious091.com',
  BillingState = 'JM',
  BillingCity = 'Jerusalém',
  Industry = 'Tourism',
  AnnualRevenue = 200000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'artur@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account091);

Account account092 = new Account(
  Name = 'Fictitious Transportation Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious092.com',
  BillingState = 'TY',
  BillingCity = 'Tóquio',
  Industry = 'Transportation',
  AnnualRevenue = 400000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'daniel@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account092);

Account account093 = new Account(
  Name = 'Fictitious Treasury Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious093.com',
  BillingState = 'VAN',
  BillingCity = 'Antuérpia',
  Industry = 'Treasury',
  AnnualRevenue = 60000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'ronaldo@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account093);

Account account094 = new Account(
  Name = 'Fictitious Underwriting Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious094.com',
  BillingState = 'O',
  BillingCity = 'Gotemburgo',
  Industry = 'Underwriting',
  AnnualRevenue = 300000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'veronica@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account094);

Account account095 = new Account(
  Name = 'Fictitious Venture Capital Company',
  Type = 'Investor',
  Rating = 'Warm',
  Website = 'https://fictitious095.com',
  BillingState = 'MAR',
  BillingCity = 'Marrakesh',
  Industry = 'Venture Capital',
  AnnualRevenue = 30000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'daniel@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account095);

Account account096 = new Account(
  Name = 'Fictitious Warehouse Management Company',
  Type = 'Customer',
  Rating = 'Hot',
  Website = 'https://fictitious096.com',
  BillingState = 'SP',
  BillingCity = 'São Paulo',
  Industry = 'Warehouse Management',
  AnnualRevenue = 120000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'veronica@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account096);

Account account097 = new Account(
  Name = 'Fictitious Waste Management Company',
  Type = 'Customer',
  Rating = 'Cold',
  Website = 'https://fictitious097.com',
  BillingState = 'TY',
  BillingCity = 'Tóquio',
  Industry = 'Waste Management',
  AnnualRevenue = 200000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'ronaldo@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account097);

Account account098 = new Account(
  Name = 'Fictitious Web Design Company',
  Type = 'Customer',
  Rating = 'Warm',
  Website = 'https://fictitious098.com',
  BillingState = 'X',
  BillingCity = 'Córdoba',
  Industry = 'Web Design',
  AnnualRevenue = 30000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'helena@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account098);

Account account099 = new Account(
  Name = 'Fictitious Web Development Company',
  Type = 'Integrator',
  Rating = 'Hot',
  Website = 'https://fictitious099.com',
  BillingState = 'RJ',
  BillingCity = 'Rio de Janeiro',
  Industry = 'Web Development',
  AnnualRevenue = 10000000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'rodrigo@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account099);

Account account100 = new Account(
  Name = 'Fictitious Wholesale Company',
  Type = 'Reseller',
  Rating = 'Hot',
  Website = 'https://fictitious100.com',
  BillingState = 'RJ',
  BillingCity = 'Rio de Janeiro',
  Industry = 'Wholesale',
  AnnualRevenue = 1000000000L,
  OwnerId = [SELECT Id FROM User WHERE Username = 'claudia@emailfalso.rds' LIMIT 1].Id
);
accounts_list.add(account100);

insert accounts_list;
