# Monoalphabetic-Substitution-Cipher-Script-in-Bash
The monoalphabetic substitution cipher replaces each letter in the plaintext with a 
corresponding letter from a substitution key. The key is a permutation of the alphabet, 
where each letter maps uniquely to another letter. For example, if the key maps 
"A" to "Q", "B" to "W", and so on, the plaintext "HELLO" might be encrypted as "ITSSG".

Bash Script
The user provides the plaintext and the substitution key (a permutation of the alphabet).
 
How the Script Works?

Input:
The user provides the plaintext to encrypt.
The user also provides a substitution key, which must be a permutation of the alphabet (26 unique lowercase letters).
Encryption Process:
The script loops through each character in the plaintext.
If the character is a lowercase letter, it finds its index in the alphabet and replaces it with the corresponding letter from the key.
If the character is an uppercase letter, it is converted to lowercase, encrypted, and then converted back to uppercase.
Non-alphabetic characters (e.g., spaces, punctuation) are left unchanged.
Validation:
The script checks that the key is exactly 26 unique lowercase letters. If not, it displays an error and exits.
Example Execution:
Plaintext: Hello, World!
Key: qwertyuiopasdfghjklzxcvbnm
Encrypted Text: Itssg, Vgksr!
How to Run the Script
Save the script to a file, e.g., cipher.sh.
Make the script executable: chmod +x cipher.sh.
Run the script: ./cipher.sh.

Security Note
This cipher is simple and easy to implement but is not secure by modern standards. It can be broken using frequency analysis, 
as the frequency of letters in the ciphertext will match the frequency of letters in the plaintext language.
