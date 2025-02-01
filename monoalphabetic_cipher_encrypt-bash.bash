#!/bin/bash

# Monoalphabetic substitution cipher in Bash

# Function to encrypt the plaintext
encrypt() {
    local plaintext="$1"
    local key="$2"
    local alphabet="abcdefghijklmnopqrstuvwxyz"
    local encrypted_text=""

    # Loop through each character in the plaintext
    for (( i=0; i<${#plaintext}; i++ )); do
        char="${plaintext:i:1}"  # Get the current character
        if [[ "$char" =~ [a-z] ]]; then
            # Find the index of the character in the alphabet
            index=$(echo "$alphabet" | grep -bo "$char" | cut -d: -f1)
            # Replace it with the corresponding character from the key
            encrypted_text+="${key:index:1}"
        elif [[ "$char" =~ [A-Z] ]]; then
            # Handle uppercase letters
            char_lower=$(echo "$char" | tr 'A-Z' 'a-z')
            index=$(echo "$alphabet" | grep -bo "$char_lower" | cut -d: -f1)
            encrypted_char=$(echo "${key:index:1}" | tr 'a-z' 'A-Z')
            encrypted_text+="$encrypted_char"
        else
            # Leave non-alphabetic characters unchanged
            encrypted_text+="$char"
        fi
    done

    echo "$encrypted_text"
}

# Main script
echo "Enter the plaintext to encrypt:"
read plaintext
echo "Enter the substitution key (26 unique lowercase letters):"
read key

# Validate the key
if [[ ${#key} -ne 26 || ! "$key" =~ ^[a-z]+$ || $(echo "$key" | grep -o . | sort | uniq | wc -l) -ne 26 ]]; then
    echo "Error: The key must be exactly 26 unique lowercase letters."
    exit 1
fi

# Encrypt the plaintext
encrypted_text=$(encrypt "$plaintext" "$key")
echo "Encrypted text: $encrypted_text"