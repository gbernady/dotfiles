#!/bin/zsh

read -s "pin?Enter new YubiKey PIN: "
echo
read -s "pin_confirm?Confirm new YubiKey PIN: "
echo

[[ "$pin" == "$pin_confirm" ]] || { echo "PINs do not match"; exit 1; }

ykman info

# fido2 / webauthn
ykman fido reset -f
ykman fido access change-pin --new-pin "${pin}"

# otp
ykman otp delete -f 1
ykman otp delete -f 2

# openpgp
export GNUPGHOME=$(mktemp -d -t gnupg_$(date +%Y%m%d%H%M)_XXX)
ykman openpgp reset -f
ykman openpgp access change-pin --pin 123456 --new-pin "${pin}"
ykman openpgp access change-admin-pin --admin-pin 12345678 --new-admin-pin "${pin}"
# ykman openpgp keys set-touch aut on -f --admin-pin "${pin}"
# ykman openpgp keys set-touch enc on -f --admin-pin "${pin}"
# ykman openpgp keys set-touch sig on -f --admin-pin "${pin}"

unset pin pin_confirm
