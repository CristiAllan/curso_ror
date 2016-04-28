require 'digest'

module GravatarHelper
    BASE_URL = "http://gravatar.com/avatar"

    def gravatar_url(email)
        hash = Digest::MD5.hexdigest(email)
        "#{BASE_URL}/#{hash}"
    end
end
