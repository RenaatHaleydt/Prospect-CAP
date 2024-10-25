sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/m/MessageBox"
],
function (Controller, MessageBox) {
    "use strict";

    return Controller.extend("prospectcreation.controller.Main", {
        // onInit is de methode die 1 keer wordt aangeroepen wanneer de view in de applicatie wordt ingeladen
        // (wanneer deze op het scherm verschijnt)
        onInit: function () {
            // Maken van een JSON model waar we de data van onze prospect in kunnen bewaren
            let oProspectModel = new sap.ui.model.json.JSONModel({
                bedrijfsnaam: null,
                email: null,
                projectnaam: null,
                kans: 20
            });

            // Lokaal JSON model binden aan de view, zodat we aan de data kunnen in de view en omgekeerd
            this.getView().setModel(oProspectModel, "prospectModel");
        },
        onProspectCreation: function(oEvent){
            // Data bekijken in de console van de F12 optie
            // console.log("just a message to be able to set a breakpoint")
            // 1 - Data mappen

            // 2 - Data versturen
            // Ophalen default model (zie manifest.json)
            var oModel = this.getOwnerComponent().getModel()
            // Creatie van list binding (om met oData v4 te werken)
            // We maken hier ook een groepering aan met de naam 'createProspect'. Deze wordt later gebruikt om de requests te groeperen in de batch
            var oListBinding = oModel.bindList("/Prospects", undefined, undefined, undefined, { $$updateGroupId: "createProspect" });
            // oData v4 werkt aan de hand van contexts, we gaan deze uit de reeds gemaakte list binding halen 
            // en invullen met de data die in ons prospects JSON model zit
            var oContext = oListBinding
                .create(this.getView().getModel("prospectModel").getData());
            // oData werkt aan de hand van batches om te communiceren met de server
            this.getOwnerComponent().getModel().submitBatch("createProspect")
                .then(function () {
				// De prospect is aangemaakt
				MessageBox.alert("Changes have been saved", {
					icon : sap.m.MessageBox.Icon.SUCCESS,
					title : "Success"
				});
			}, function (oError) {
                // Er ging iets fout tijdens het aanmaken van de prospect
				MessageBox.alert(oError.message, {
					icon : sap.m.MessageBox.Icon.ERROR,
					title : "Unexpected Error"
				});
			});
        }
    });
});
