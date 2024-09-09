class Hush < Formula
  desc "Shush like tool, but CLI based"
  homepage "https://github.com/trobrock/hush"
  url "https://github.com/trobrock/hush/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "6ecdfb378945336c2c7a6950b56cd8cd3777472cd8c5d4ea58f111a19cae88b2"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"hush"
  end

  test do
    system "#{bin}/hush", "--help"
  end
end
