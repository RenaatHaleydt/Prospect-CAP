module.exports = async function (srv) {
    srv.before("CREATE", "Prospects", async (oReq) => {
      console.log("let's try")
    });
}