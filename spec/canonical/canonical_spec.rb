require 'rack-canonical-header/middleware'

RSpec.describe Canonical::Middleware do
  let(:content_type) { 'html' }
  let(:app) { double('app', call: [200, { 'Content-Type' => content_type }, '']) }
  let(:canonical_host) { 'www.canonical.me' }
  let(:url_scheme) { 'https' }
  let(:fullpath) { '/test' }
  let(:default_env_args) do
    {
      'rack.url_scheme' => url_scheme,
      'ORIGINAL_FULLPATH' => fullpath
    }
  end

  let(:env_args) { default_env_args }
  let(:built_http_canonical_header) { "<http://#{canonical_host}/test>; rel=\"canonical\"" }
  let(:built_https_canonical_header) { "<https://#{canonical_host}/test>; rel=\"canonical\"" }

  subject { described_class.new(app).call(env_args)[1] }

  context 'when there is a CANONICAL_HOST env set' do
    before do
      allow(ENV).to receive(:[]).with('CANONICAL_HOST').and_return(canonical_host)
    end

    it 'replaces the host with the APP_HOST' do
      expect(subject['Link']).to eq built_https_canonical_header
      expect(app).to have_received :call
    end

    context 'when the url scheme is http' do
      let(:url_scheme) { 'http' }

      it 'only replaces the host and preserves the scheme' do
        expect(subject['Link']).to eq built_http_canonical_header
      end
    end

    context 'when a forwarded protocol is set' do
      let(:url_scheme) { 'http' }
      let(:env_args) { default_env_args.merge('HTTP_X_FORWARDED_PROTO' => 'https') }

      it 'uses the forwarded protocol' do
        expect(subject['Link']).to eq built_https_canonical_header
      end
    end

    context 'when the requested content type is not html' do
      let(:content_type) { 'application/json' }

      it 'does not insert a link header' do
        expect(subject.keys).not_to include 'Link'
      end
    end
  end

  context 'when there is no CANONICAL_HOST env set' do
    it 'does not insert a link header' do
      expect(subject.keys).not_to include 'Link'
    end
  end
end
