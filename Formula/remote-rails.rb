class RemoteRails < Formula
  desc 'A CLI tool for interacting with a rail app in ECS'
  homepage 'https://github.com/trobrock/remote-rails'
  url 'https://github.com/trobrock/remote-rails.git', tag: '1.0.0'

  head 'https://github.com/trobrock/remote-rails.git', branch: 'main'

  depends_on 'jq'

  def install
    bin.install "bin/remote-rails"
  end

  test do
    assert_match 'usage: remote-rails', pipe_output('remote-rails -h')
  end
end
