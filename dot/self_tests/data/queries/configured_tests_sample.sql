-- non static data -entities and tests +

-- this entity has only an entity as it is normally defined; there no impact views in the test setup, thus no data to test
INSERT INTO self_tests_dot.configured_entities VALUES('Muso','66f5d13a-8f74-4f97-836b-334d97932781', 'ancview_delivery', 'anc', '{{ config(materialized=''view'') }}
{% set schema = <schema> %}

select *
from {{ schema }}.ancview_delivery','2021-12-07 00:00:00+00','2021-12-07 00:00:00+00','Matt');

-- same as above, this configured test cannot be run
INSERT INTO self_tests_dot.configured_tests
(test_activated, project_id, test_id, scenario_id, priority, description, impact, proposed_remediation, entity_id, test_type, column_name, column_description, test_parameters, date_added, date_modified, last_updated_by)
VALUES(TRUE, 'Muso', '7f78de0e-8268-3da6-8845-9a445457cc9a', 'DUPLICATE-1', 3, '', '', '', 'adc007dd-2407-3dc2-95a7-002067e741f9', 'possible_duplicate_forms', '', '',
$${"table_specific_uuid": "uuid", "table_specific_period": "day", "table_specific_patient_uuid": "patient_id", "table_specific_reported_date": "delivery_date"}$$
, '2021-12-23 19:00:00.000 -0500', '2021-12-23 19:00:00.000 -0500', 'Lorenzo');

INSERT INTO self_tests_dot.configured_entities VALUES('Muso','95bd0f60-ab59-48fc-a62e-f256f5f3e6de', 'fpview_registration', 'fp', 'select * from
(values (''patient-id1'', ''1''), (''patient_id2'', ''2''), (''patient_id3'', ''3'')) x(patient_id, value)
','2021-12-07 00:00:00+00','2021-12-07 00:00:00+00','Matt');

-- NFP-1
INSERT INTO self_tests_dot.configured_tests
(test_activated, project_id, test_id, scenario_id, priority, description, impact, proposed_remediation, entity_id, test_type, column_name, column_description, test_parameters, date_added, date_modified, last_updated_by)
VALUES(TRUE, 'Muso', 'c4a3da8f-32f4-4e9b-b135-354de203ca70', 'TREAT-1', 5, 'Test for new family planning method (NFP-1)', '', '', '52aa8e99-5221-3aac-bca5-b52b80b90929', 'custom_sql', '', '',
$${"query": "SELECT patient_id as primary_table_id_field, 'dot_model__fpview_registration' as primary_table, value FROM {{ ref('dot_model__fpview_registration') }} a LIMIT 2"}$$
, '2021-12-23 19:00:00.000 -0500', '2021-12-23 19:00:00.000 -0500', 'Leah');