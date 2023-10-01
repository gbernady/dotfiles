#!/bin/sh

pin="$(op read 'op://Personal/Yubikey/password')"

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

gpgkeyid="$(op read 'op://Personal/GPG Key/keyid')"
gpgpass="$(op read 'op://Personal/GPG Key/password')"

op read -o "$GNUPGHOME/key" "op://Personal/GPG Key/add more/$gpgkeyid.master.key"
gpg --pinentry-mode loopback --import "$GNUPGHOME/key" <<END
${gpgpass}
END
rm -f "$GNUPGHOME/key"

gpg --command-fd=0 --status-fd=1 --pinentry-mode loopback --edit-card <<END
admin
name
Bernady
Grzegorz
${pin}
lang
en
quit
END

gpg --command-fd=0 --status-fd=1 --pinentry-mode loopback --edit-key "${gpgkeyid}" <<END
key 1
keytocard
1
${gpgpass}
${pin}
key 1
key 2
keytocard
2
${gpgpass}
${pin}
key 2
key 3
keytocard
3
${gpgpass}
${pin}
key 3
save
END

