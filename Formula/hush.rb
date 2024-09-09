class Hush < Formula
  desc "Shush like tool, but CLI based"
  homepage "https://github.com/trobrock/hush"
  url "https://github.com/trobrock/hush/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "16796b7a372ce94321cc259e20564ca5e80b1b515b0febe9627edbe5cc4bd818"
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
