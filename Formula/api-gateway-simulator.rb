class ApiGatewaySimulator < Formula
  desc 'a local dev simulator for API gateway -> lambda'
  homepage 'https://github.com/trobrock/api-gateway-simulator'
  url 'https://github.com/trobrock/api-gateway-simulator.git', tag: '2.0.0'

  head 'https://github.com/trobrock/api-gateway-simulator.git'

  depends_on "ruby"

  def install
    libexec.install ['bin', 'lib', 'Gemfile', 'Gemfile.lock']

    ENV['GEM_HOME'] = libexec
    ENV['BUNDLE_PATH'] = libexec
    ENV['BUNDLE_GEMFILE'] = libexec / 'Gemfile'
    system 'gem', 'install', 'bundler'
    ENV.prepend_path "PATH", libexec/"bin"
    system 'bundle', 'install'

    (bin/"api-gateway-simulator").write <<~EOS
      #!/bin/bash
      export GEM_HOME="#{libexec}"
      export BUNDLE_PATH="#{libexec}"
      export BUNDLE_GEMFILE="#{libexec}/Gemfile"
      exec bundle exec "#{libexec}/bin/api-gateway-simulator" "$@"
    EOS
  end

  test do
    assert_match 'usage: api-gateway-simulator', pipe_output('api-gateway-simulator -h')
  end
end
