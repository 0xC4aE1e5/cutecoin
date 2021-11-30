# Cutecoin
Cutecoin is a simple, private<sup>1</sup>, and secure<sup>2</sup> cryptocurrency.
## Usage
### `/pay`
Pays from a wallet to another wallet.

Uses `POST`: No

`f`: From wallet. Must be a private key.

`t`: To wallet. Must be a public key.

`a`: The amount of money the from wallet loses, the to wallet gains
### `/new_wallet`
Creates a new wallet. Outputs are ready-to-go `GET` paramaters

Uses `POST`: No
### `/buy`
Adds money to a wallet, from the abyss

Uses `POST`: Yes

`t`: The wallet to give money to

`a`: The amount of money to give
### `/sell`
Removes money from a wallet, to the abyss

Uses `POST`: Yes

`t`: The wallet to remove money from

`a`: The amount of money to remove
<h6>1: It's untracable. The only data stored in the database are the amount of money per wallet, and private key info.</h6>
<h6>2: That is, if used properly.</h6>