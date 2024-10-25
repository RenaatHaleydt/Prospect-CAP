sap.ui.define([
    "sap/ui/core/mvc/Controller"
],
function (Controller) {
    "use strict";

    return Controller.extend("prospectcreation.controller.Main", {
        onInit: function () {
            let oProspectModel = new sap.ui.model.json.JSONModel({
                bedrijfsnaam: null,
                email: null,
                projectnaam: null,
                kans: 20
            });

            this.getView().setModel(oProspectModel, "prospectModel");
        }
    });
});
