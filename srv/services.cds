using { Prospect as my } from '../db/schema';

/**
 * Service used by support personell, i.e. the incidents' 'processors'.
 */
service ProspectService { 
    entity Prospects as projection on my.Prospects;
    entity Contacts as projection on my.Persons;

    action TriggerBusinessProcess(Context: BusinessProcessContext) returns String;
    
    type BusinessProcessContext {
    // RoleTitle: String;
		// RestrictionField: String;
	}
}