using complianterp.model from '../db/data-model';

// [ADDING EXTERNAL SERVICE] To add entities from external services:
// [ADDING EXTERNAL SERVICE] - STEP 1 - Add a data model from an external service to the project (by selecting the relevant menu option in SAP Web IDE).
// [ADDING EXTERNAL SERVICE] - STEP 2 - Add a reference to the external service model file:
// using <external_service_name> as <alias_name> from '../srv/external/csn/<external_service_name>';

service MenuService {
	entity MainMenu @readonly as projection on model.SideMain;
	entity SubMenu @readonly as projection on model.SideSubMenu;
	view Fixed as select from model.SideMain { id, title, icon } where location='fix' order by sorting;
	view Menu as select from model.SideMain { id, title, icon, expanded, submenu, viewname } where location='dyn' order by sorting; 

	// [ADDING EXTERNAL SERVICE] - STEP 3 - Add a new entity to the exposed service model:
	// @cds.persistence.skip
	// entity <entity_name> as projection on <alias_name>.<external_entity_name>;

}
