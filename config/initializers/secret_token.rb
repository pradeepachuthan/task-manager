# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Task::Application.config.secret_key_base = 'c8abc127f19aa15c2efa8837c7eedb54b151f7a9aad78bf491929e5c74e2b7ada32379377902b5217b302b62cc20bc0099b758ea11338fa38d9ab81b0e643cf5'
