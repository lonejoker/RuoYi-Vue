import JSEncrypt from 'jsencrypt/bin/jsencrypt.min'

// 密钥对生成 http://web.chacuo.net/netrsakeypair

const publicKey = 'MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBANFpEjm/b2JZoXen/2+2MuZ/PkdmhISr'
+'8EEZC2IBUnx1Cj5l9ROqFvR2hAGPCw65CSEkzKniI9EdQdxe2Tsay+0CAwEAAQ=='

// const privateKey = 'MIIBVgIBADANBgkqhkiG9w0BAQEFAASCAUAwggE8AgEAAkEA0WkSOb9vYlmhd6f/'
// +'b7Yy5n8+R2aEhKvwQRkLYgFSfHUKPmX1E6oW9HaEAY8LDrkJISTMqeIj0R1B3F7Z'
// +'OxrL7QIDAQABAkEAi+wW/3sIY8DcAOXB6dTmIdl3taGsfjGcsQKY9n1HrlwYZrZx'
// +'cK7GlRNuK9SrFhjIIgfRVik5cQ1C7EwKCGEUyQIhAOxWZiIeFTi039sA4QJF6AJg'
// +'o0ZVaAnd3XmimB8oIdwrAiEA4tUrhEys2mQOam41BtbNFbOWHksPvXOr+0m4ASX6'
// +'NEcCIQDIWuqUy9oDy9rm59TZP3hT46cnbioYCz3B62R5LWWfJwIgMkF4er9iLKCu'
// +'cPYp2XINzhkT0XJf8mGGYQ5cLiTz4lECIQCVKPZ6iD8nc/RfM8Qxu4LERsfle2Nv'
// +'yyETBh+mjf0Vtg=='

// 加密
export function encrypt(txt) {
  const encryptor = new JSEncrypt()
  encryptor.setPublicKey(publicKey) // 设置公钥
  return encryptor.encrypt(txt) // 对数据进行加密
}

// 解密
// export function decrypt(txt) {
//   const encryptor = new JSEncrypt()
//   encryptor.setPrivateKey(privateKey) // 设置私钥
//   return encryptor.decrypt(txt) // 对数据进行解密
// }

