class Hush < Formula
  desc "Shush like tool, but CLI based"
  homepage "https://github.com/trobrock/hush"
  url "https://github.com/trobrock/hush/archive/refs/tags/v0.0.3.tar.gz"
  sha256 "c0cf1abda442a896570ef0f8fec3e71fd57c312af782b51bd91a137121170747"
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
