# Set up users
class profiles::users {
  lookup('users', Hash, 'hash').each | String $username, Hash $attrs | {
    accounts::user { $username:
      * => $attrs,
    }
  }
}

