class Hush < Formula
  desc "Shush like tool, but CLI based"
  homepage "https://github.com/trobrock/hush"
  url "https://github.com/trobrock/hush/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "3f101e731e15adaca17cdc343ed000d24f929322ef3be03ae6000b0bbf9c2ba9"
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
