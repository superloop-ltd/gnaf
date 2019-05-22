INSERT INTO `ADDRESS_SEARCH` (address_detail_pid, address_search, street_locality_pid, locality_pid)
SELECT ad.address_detail_pid, CONCAT_WS(' ',
  IF(lot_number IS NULL, NULL, CONCAT_WS(' ', 'LOT', lot_number_prefix, lot_number, lot_number_suffix)),
  flat_type_code, flat_number_prefix, flat_number, flat_number_suffix,
  level_type_code, level_number_prefix, level_number, level_number_suffix,
  NULLIF(CONCAT_WS('-',
    NULLIF(CONCAT_WS('', number_first_prefix, number_first, number_first_suffix), ''),
    NULLIF(CONCAT_WS('', number_last_prefix, number_last, number_last_suffix), '')
  ), ''),
  street_name, street_type_code, street_suffix_code,
  locality_name, state_abbreviation
), ad.street_locality_pid, ad.locality_pid
FROM ADDRESS_DETAIL ad
JOIN ADDRESS_SITE s ON (ad.address_site_pid = s.address_site_pid)
JOIN STREET_LOCALITY sl ON (ad.street_locality_pid = sl.street_locality_pid)
JOIN LOCALITY l ON (ad.locality_pid = l.locality_pid)
JOIN STATE t ON (l.state_pid = t.state_pid);

--
-- Indexes for table `ADDRESS_SEARCH`
--
ALTER TABLE `ADDRESS_SEARCH`
  ADD PRIMARY KEY (`address_detail_pid`),
  ADD KEY `street_locality_pid` (`street_locality_pid`),
  ADD KEY `locality_pid` (`locality_pid`),
  ADD FULLTEXT KEY `address_search` (`address_search`);
