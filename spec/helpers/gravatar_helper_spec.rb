require 'rails_helper'



RSpec.describe GravatarHelper, type: :helper do
 describe '#url' do
      it  'return the gravatar url' do
        expect(helper.gravatar_url('contato@thiagobelem.net')).to eq("http://gravatar.com/avatar/67a6eb9b43b617b2051b912b8373a156")
      end
  end
end
