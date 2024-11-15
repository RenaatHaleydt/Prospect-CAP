const httpclient = require("@sap-cloud-sdk/http-client");

module.exports = async function (srv) {
    srv.before("CREATE", "Prospects", async (oReq) => {
      console.log("let's try")
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