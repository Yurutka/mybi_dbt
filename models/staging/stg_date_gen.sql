SELECT gcf.id as id,
    gcf.account_id as account_id, service,
    dates_id, full_date as date_payment,
    sites_id,domain,
    traffic_id,grouping, source
    , null as leads_id --test_database.amocrm_leads_facts
	, null as open_date --test_database.amocrm_leads_facts
	, null as close_date, --test_database.amocrm_leads_facts
    impressions,
    clicks,
    cost,
    vat_included
    , null as price
    FROM
test_database.general_costs_facts gcf JOIN test_database.general_dates gd
ON gcf.dates_id=gd.id
JOIN test_database.general_sites gs 
ON gcf.sites_id=gs.id
JOIN test_database.general_traffic gt 
ON gcf.traffic_id=gt.id
join test_database.general_accounts ga
 on gcf.account_id=ga.account_id
 
 union ALL 
 
 SELECT alf.id,
    null as account_id, null as service,
    null as dates_id, null as date_payment,
    null as sites_id, null as domain,
    null as traffic_id, null as grouping, null as source
    , leads_id --test_database.amocrm_leads_facts
	, gd.full_date as open_date --test_database.amocrm_leads_facts
	, gd2.full_date as close_date, --test_database.amocrm_leads_facts 
    null as impressions,
    null as clicks,
    null as cost,
    null as vat_included,
    price
from test_database.amocrm_leads_facts alf JOIN test_database.general_dates gd
ON alf.created_id=gd.id
 JOIN test_database.general_dates gd2
ON alf.closed_id=gd2.id
