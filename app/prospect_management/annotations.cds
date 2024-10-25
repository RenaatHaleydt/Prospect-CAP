using ProspectService as service from '../../srv/services';
annotate service.Prospects with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : bedrijfsnaam,
            },
            {
                $Type : 'UI.DataField',
                Value : email,
            },
            {
                $Type : 'UI.DataField',
                Value : projectnaam,
            },
            {
                $Type : 'UI.DataField',
                Label : 'kans',
                Value : kans,
            },
            {
                $Type : 'UI.DataField',
                Label : 'prioriteit_code',
                Value : prioriteit_code,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : bedrijfsnaam,
        },
        {
            $Type : 'UI.DataField',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Value : projectnaam,
        },
        {
            $Type : 'UI.DataField',
            Label : 'kans',
            Value : kans,
        },
        {
            $Type : 'UI.DataField',
            Label : 'prioriteit_code',
            Value : prioriteit_code,
        },
    ],
);

annotate service.Prospects with {
    contactpersoon @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Contacts',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : contactpersoon_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'voornaam',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'familienaam',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'naam',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'email',
            },
        ],
    }
};

