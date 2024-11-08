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
            Value : projectnaam,
        },
        {
            $Type : 'UI.DataField',
            Value : email,
        },
        {
            $Type : 'UI.DataField',
            Value : contactpersoon.naam,
        },
        {
            $Type : 'UI.DataField',
            Value : prioriteit.descr,
        },
    ],
    UI.SelectionFields : [
        bedrijfsnaam,
        contactpersoon.naam,
        projectnaam,
        prioriteit.descr,
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

annotate service.Contacts with {
    naam @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Contacts',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : naam,
                    ValueListProperty : 'voornaam',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'naam',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};

annotate service.Contacts with {
    voornaam @Common.Text : familienaam
};

annotate service.Prioriteit with {
    descr @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Prioriteit',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : descr,
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'descr',
                },
            ],
        },
        Common.ValueListWithFixedValues : true
)};

annotate service.Prioriteit with {
    name @Common.Text : descr
};

