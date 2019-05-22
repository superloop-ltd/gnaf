--
-- Indexes for dumped tables
--

--
-- Indexes for table `ADDRESS_ALIAS`
--
ALTER TABLE `ADDRESS_ALIAS`
  ADD PRIMARY KEY (`address_alias_pid`),
  ADD KEY `ADDRESS_ALIAS_FK1` (`alias_pid`),
  ADD KEY `ADDRESS_ALIAS_FK2` (`alias_type_code`),
  ADD KEY `ADDRESS_ALIAS_FK3` (`principal_pid`);

--
-- Indexes for table `ADDRESS_ALIAS_TYPE_AUT`
--
ALTER TABLE `ADDRESS_ALIAS_TYPE_AUT`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `ADDRESS_DEFAULT_GEOCODE`
--
ALTER TABLE `ADDRESS_DEFAULT_GEOCODE`
  ADD PRIMARY KEY (`address_default_geocode_pid`),
  ADD UNIQUE KEY `address_detail_pid` (`address_detail_pid`),
  ADD KEY `ADDRESS_DEFAULT_GEOCODE_FK2` (`geocode_type_code`);

--
-- Indexes for table `ADDRESS_DETAIL`
--
ALTER TABLE `ADDRESS_DETAIL`
  ADD PRIMARY KEY (`address_detail_pid`),
  ADD KEY `ADDRESS_DETAIL_FK1` (`address_site_pid`),
  ADD KEY `street_locality_pid` (`street_locality_pid`),
  ADD KEY `locality_pid` (`locality_pid`);

--
-- Indexes for table `ADDRESS_MESH_BLOCK_2011`
--
ALTER TABLE `ADDRESS_MESH_BLOCK_2011`
  ADD PRIMARY KEY (`address_mesh_block_2011_pid`);

--
-- Indexes for table `ADDRESS_MESH_BLOCK_2016`
--
ALTER TABLE `ADDRESS_MESH_BLOCK_2016`
  ADD PRIMARY KEY (`address_mesh_block_2016_pid`);

--
-- Indexes for table `ADDRESS_SITE`
--
ALTER TABLE `ADDRESS_SITE`
  ADD PRIMARY KEY (`address_site_pid`);

--
-- Indexes for table `ADDRESS_SITE_GEOCODE`
--
ALTER TABLE `ADDRESS_SITE_GEOCODE`
  ADD PRIMARY KEY (`address_site_geocode_pid`),
  ADD KEY `address_site_pid` (`address_site_pid`);

--
-- Indexes for table `ADDRESS_TYPE_AUT`
--
ALTER TABLE `ADDRESS_TYPE_AUT`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `FLAT_TYPE_AUT`
--
ALTER TABLE `FLAT_TYPE_AUT`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `GEOCODED_LEVEL_TYPE_AUT`
--
ALTER TABLE `GEOCODED_LEVEL_TYPE_AUT`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `GEOCODE_RELIABILITY_AUT`
--
ALTER TABLE `GEOCODE_RELIABILITY_AUT`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `GEOCODE_TYPE_AUT`
--
ALTER TABLE `GEOCODE_TYPE_AUT`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `LEVEL_TYPE_AUT`
--
ALTER TABLE `LEVEL_TYPE_AUT`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `LOCALITY`
--
ALTER TABLE `LOCALITY`
  ADD PRIMARY KEY (`locality_pid`),
  ADD KEY `state_pid` (`state_pid`),
  ADD KEY `locality_name` (`locality_name`);

--
-- Indexes for table `LOCALITY_ALIAS`
--
ALTER TABLE `LOCALITY_ALIAS`
  ADD PRIMARY KEY (`locality_alias_pid`);

--
-- Indexes for table `LOCALITY_ALIAS_TYPE_AUT`
--
ALTER TABLE `LOCALITY_ALIAS_TYPE_AUT`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `LOCALITY_CLASS_AUT`
--
ALTER TABLE `LOCALITY_CLASS_AUT`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `LOCALITY_NEIGHBOUR`
--
ALTER TABLE `LOCALITY_NEIGHBOUR`
  ADD PRIMARY KEY (`locality_neighbour_pid`);

--
-- Indexes for table `LOCALITY_POINT`
--
ALTER TABLE `LOCALITY_POINT`
  ADD PRIMARY KEY (`locality_point_pid`);

--
-- Indexes for table `MB_2011`
--
ALTER TABLE `MB_2011`
  ADD PRIMARY KEY (`mb_2011_pid`);

--
-- Indexes for table `MB_2016`
--
ALTER TABLE `MB_2016`
  ADD PRIMARY KEY (`mb_2016_pid`);

--
-- Indexes for table `MB_MATCH_CODE_AUT`
--
ALTER TABLE `MB_MATCH_CODE_AUT`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `PRIMARY_SECONDARY`
--
ALTER TABLE `PRIMARY_SECONDARY`
  ADD PRIMARY KEY (`primary_secondary_pid`);

--
-- Indexes for table `PS_JOIN_TYPE_AUT`
--
ALTER TABLE `PS_JOIN_TYPE_AUT`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `STATE`
--
ALTER TABLE `STATE`
  ADD PRIMARY KEY (`state_pid`);

--
-- Indexes for table `STREET_CLASS_AUT`
--
ALTER TABLE `STREET_CLASS_AUT`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `STREET_LOCALITY`
--
ALTER TABLE `STREET_LOCALITY`
  ADD PRIMARY KEY (`street_locality_pid`),
  ADD KEY `STREET_LOCALITY_FK2` (`locality_pid`);

--
-- Indexes for table `STREET_LOCALITY_ALIAS`
--
ALTER TABLE `STREET_LOCALITY_ALIAS`
  ADD PRIMARY KEY (`street_locality_alias_pid`),
  ADD KEY `STREET_LOCALITY_ALIAS_FK4` (`street_type_code`);

--
-- Indexes for table `STREET_LOCALITY_ALIAS_TYPE_AUT`
--
ALTER TABLE `STREET_LOCALITY_ALIAS_TYPE_AUT`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `STREET_LOCALITY_POINT`
--
ALTER TABLE `STREET_LOCALITY_POINT`
  ADD PRIMARY KEY (`street_locality_point_pid`),
  ADD KEY `STREET_LOCALITY_POINT_FK1` (`street_locality_pid`);

--
-- Indexes for table `STREET_SUFFIX_AUT`
--
ALTER TABLE `STREET_SUFFIX_AUT`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `STREET_TYPE_AUT`
--
ALTER TABLE `STREET_TYPE_AUT`
  ADD PRIMARY KEY (`code`);
