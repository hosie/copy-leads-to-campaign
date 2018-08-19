const rp = require('request-promise')
var credentialsObject = 'grant_type=password&password=enamI_dei...9YpB3E0a&username=apiKey';

if (!(process.env.IBM_CLOUD_API_KEY) || !(process.env.IBM_CLOUD_API_KEY.length > 0)) {
  console.error("IBM_CLOUD_API_KEY not set")
  process.exit(1)
}

if (!(process.env.IBM_CLOUD_API_KEY) || !(process.env.APP_CONNECT_INSTANCE_ID.length > 0)) {
  console.error("APP_CONNECT_INSTANCE_ID not set")
  process.exit(1)
}

rp.post(`https://firefly-api-prod.appconnect.ibmcloud.com/${process.env.APP_CONNECT_INSTANCE_ID}/tokens`,{
  json:true,
  headers: {
     "Content-Type": "application/x-www-form-urlencoded"
  },
  form: {
    grant_type: 'password',
    username: 'apiKey',
    password: process.env.IBM_CLOUD_API_KEY
  }
})
.then(function (res) {
  console.log(`export APP_CONNECT_JWT=${res.access_token}`)

})
.catch(function (err) {
  console.error("error")
  console.error(err.message)
});
