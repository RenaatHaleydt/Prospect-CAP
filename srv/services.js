const httpclient = require("@sap-cloud-sdk/http-client");

module.exports = async function (srv) {
  srv.after("CREATE", "Prospects", async (oReq) => {
    let oData = {
      "definitionId": "us10.44a4fb04trial.prospectprocess.prospectProcess",
      "context": {
        "prospect": {
          "bedrijfsNaam": oReq.bedrijfsnaam,
          "email": oReq.email,
          "projectNaam": oReq.projectnaam
        }
      }
    }

    let oResponse = await startBusinessProcess(oData)
  });

  srv.before("READ", "Prospects", async (oReq) => {
    let products = await getFirstProductFromNorthwind()
  });
}

async function getFirstProductFromNorthwind() {
  let oResponse = await httpclient.executeHttpRequest({
    destinationName: 'northwind'
  }, {
    method: 'GET',
    url: '/Products',
    headers: {
      "Content-Type": 'application/json'
    },
    params: {
      top: 1,
      format: 'json'
    },
    parameterEncoder: httpclient.encodeAllParameters
  }).catch(oError => {
    console.log(`Something went wrong connecting to the Northwind destination`)
  });
  return oResponse.data;
}

async function startBusinessProcess(payload) {
  let oResponse = await httpclient.executeHttpRequest({
    destinationName: 'bpmworkflowruntime'
  }, {
    method: 'POST',
    url: '/public/workflow/rest/v1/workflow-instances',
    headers: {
      "Content-Type": 'application/json'
    },
    data: oData
  }).catch(oError => {
    console.log(`Something went wrong connecting to the Build Process Automation destination`)
    return null
  });
  return oResponse.data;
}