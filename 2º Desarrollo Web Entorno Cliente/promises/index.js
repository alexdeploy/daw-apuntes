import asyncRequest from './asyncRequest.js'

const cutriFectch = (resource) => new Promise((resolve) => asyncRequest(resource, () => resolve))

cutriFectch("resource1")