class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.17/jolt-v0.7.17-aarch64-macos.tar.gz"
      sha256 "572a3b2c0f91d0379bd1b5a9342c8f270f0656efcb5209f978636ac7baa24be1"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.17/jolt-v0.7.17-x86_64-linux.tar.gz"
      sha256 "c811d9845e91ef765d33e36d5982cddf093e1003c32ca690f5e88d6b5116a9a0"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
