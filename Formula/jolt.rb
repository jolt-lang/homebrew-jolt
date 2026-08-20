class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.19/jolt-v0.7.19-aarch64-macos.tar.gz"
      sha256 "5a462457bd6ece0b690d5cf3017e77509441bba19feace2df9ce8ab831d3f8fb"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.19/jolt-v0.7.19-x86_64-linux.tar.gz"
      sha256 "450cd5e3e9c5d3e4c8f9a7ac4f73b9824a99b6588767693f9ebc7e4c474e4d38"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
