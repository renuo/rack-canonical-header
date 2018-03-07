RSpec.describe Canonical::Header do
  it 'has a version number' do
    expect(Canonical::Header::VERSION).not_to be nil
  end
end
