class Hush < Formula
  desc "Shush like tool, but CLI based"
  homepage "https://github.com/trobrock/hush"
  url "https://github.com/trobrock/hush/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "508728db28db84d37d5fb30182b6f88bb722f461660fdd4861110038fe998518"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"hush"
  end

  test do
    system "#{bin}/hush", "--help"
  end

  service do
    run [opt_bin/"hush"]
    environment_variables PATH: std_service_path_env
    keep_alive true
    log_path var/"log/hush.log"
    error_log_path var/"log/hush.log"
  end
end
