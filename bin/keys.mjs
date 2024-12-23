#!/usr/bin/env node

import crypto from 'node:crypto' // {{{1
const algorithm = { name: "Ed25519", }
const base64ToUint8 = (str) => Uint8Array.from(atob(str), (c) => c.charCodeAt(0))
const uint8ToBase64 = (arr) => Buffer.from(arr).toString('base64')
// HUGE thanks to:
// - https://1loc.dev/string/convert-an-uint8-array-to-a-base64-encoded-string/

async function generate_keypair () { // {{{1
  const keypair = await crypto.subtle.generateKey(algorithm, true, ['sign', 'verify'])
  let pk = await crypto.subtle.exportKey('raw', keypair.publicKey)
  let sk = await crypto.subtle.exportKey('jwk', keypair.privateKey)
  pk = uint8ToBase64(new Uint8Array(pk))
  sk = JSON.stringify(sk)
  console.log(sk)
  console.log(pk)
}

await generate_keypair()
