sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'prospectmanagement/test/integration/FirstJourney',
		'prospectmanagement/test/integration/pages/ProspectsList',
		'prospectmanagement/test/integration/pages/ProspectsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProspectsList, ProspectsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('prospectmanagement') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProspectsList: ProspectsList,
					onTheProspectsObjectPage: ProspectsObjectPage
                }
            },
            opaJourney.run
        );
    }
);