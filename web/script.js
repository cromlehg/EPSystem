console.log('Loading web3')
Web3 = require('web3')
console.log('Initialize provider')
web3 = new Web3(new Web3.providers.HttpProvider("http://83.149.198.166:8545"))
console.log('Check connection')
if(web3.isConnected()) {
  console.log('Ok')
} else {
  console.log('Failed')
}
