using {
    cuid,
    managed,
    sap.common.CodeList
} from '@sap/cds/common';

/**
* Prospects
*/
context Prospect {
    entity Prospects : cuid, managed {
        bedrijfsnaam   : String @title: 'Bedrijfsnaam';
        email          : String @title: 'Algemeen mailadres';
        projectnaam    : String @title: 'Naam van het project';
        kans           : Integer default 20;
        // contactpersoon : Association to Persons;
        // prioriteit     : Association to Prioriteit default 'L';
    }

    /**
    * Person
    */
    entity Persons : cuid, managed {
        voornaam    : String;
        familienaam : String;
        naam        : String = voornaam || ' ' || familienaam;
        email       : EMailAddress;
        telefoon    : PhoneNumber;
    }

    entity Prioriteit : CodeList {
        key code : String enum {
                high   = 'H';
                medium = 'M';
                low    = 'L';
            };
    }

    type EMailAddress : String;
    type PhoneNumber  : String;
}
