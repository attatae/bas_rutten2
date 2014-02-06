# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Network::Application.config.secret_key_base = '93a39a5a8874768d495836dc73be392b90965b0476bb64997b9a7b85ccbcdd45b3e8923ca411077f6964a63f33ab7c87c26ddc9d3981f252fdea1624c036d8e3'
