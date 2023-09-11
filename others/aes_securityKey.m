function key = aes_securityKey

keyGen = javaMethod('getInstance', 'javax.crypto.KeyGenerator', 'AES');
secureRandom = java.security.SecureRandom;
keyGen.init(256, secureRandom.getInstanceStrong)
key = keyGen.generateKey;

end