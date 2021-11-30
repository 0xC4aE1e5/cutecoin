require "sinatra"
require "securerandom"
require "json"

if File.file? "wallets.json"
    0    
else
    File.write "wallets.json", "{}"
end
get "/pay" do
    wallets = JSON.parse File.read "wallets.json"
    if wallets[wallets[params["f"]][0]] < params["a"].to_f
        return "Bad Transaction! Not Enough Money! FFF"
    elsif wallets[params["f"]] != [wallets[params["f"]][0]]
        return "Bad Transaction! Invalid Key! FFF"
    end
    wallets[wallets[params["f"]][0]] -= params["a"].to_f
    wallets[params["t"]] += params["a"].to_f
    File.write("wallets.json", wallets.to_json)
    wallets = nil
    "SSS"
end
get "/new_wallet" do
    wallets = JSON.parse File.read "wallets.json"
    pubkey = SecureRandom.hex(16)
    prvkey = SecureRandom.hex(32)
    pub = 0
    prv = [pubkey]
    wallets[pubkey] = pub
    wallets[prvkey] = prv
    File.write("wallets.json", wallets.to_json)
    wallets = nil
    "?pub=#{pubkey}&prv=#{prvkey}"
end
post "/buy" do
    wallets = JSON.parse File.read "wallets.json"
    wallets[wallets[params["t"]][0]] += params["a"].to_f
    File.write("wallets.json", wallets.to_json)
    return "SSS"
end
post "/sell" do
    wallets = JSON.parse File.read "wallets.json"
    wallets[wallets[params["t"]][0]] -= params["a"].to_f
    File.write("wallets.json", wallets.to_json)
    return "SSS"
end