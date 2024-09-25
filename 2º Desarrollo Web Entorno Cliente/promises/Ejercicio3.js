const asyncRequest = require('./asyncRequest.js')

const cutriFectch = (resource) => new Promise((resolve) => asyncRequest(resource, () => resolve))

const cutriFectch2 = (resource) => asyncRequest(resource, () => new Promise((resolve) => resolve))

cutriFectch("resource1")

cutriFectch2("resource1")

// Ejercicio 1



