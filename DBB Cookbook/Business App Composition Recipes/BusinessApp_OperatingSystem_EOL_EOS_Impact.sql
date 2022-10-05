SELECT
    ba_comp.device_fk               AS eol_device_fk
    ,compute.device_serial          AS eol_device_serial
    ,ba_comp.impacted_object        AS impacted_object_name
    ,ba_comp.business_app_name      AS impacted_businessapp
    ,ba_comp.businessapplication_fk
    ,ba_comp.impact_reason
    ,ba_comp.relationship_type
    ,ba_comp.component_type
    ,compute.os_name
    ,compute.os_vendor
    ,compute.os_architecture
    ,compute.os_version
    ,compute.os_version_number
    ,compute.os_end_of_life
    ,compute.os_end_of_support
FROM view_dbb_adm_businessapp_composition_v2 ba_comp
JOIN view_dbb_compute_v2 compute
    ON compute.device_fk = ba_comp.device_fk 
WHERE
    compute.os_end_of_life          < current_date - 90
    OR compute.os_end_of_support    < current_date - 90;
    