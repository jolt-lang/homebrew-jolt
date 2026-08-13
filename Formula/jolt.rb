class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.8/jolt-v0.7.8-aarch64-macos.tar.gz"
      sha256 "e9cca81e63339ec533d1bc6c2627d3aac8c550cd13c244e9d6f4c6cf32eb11f4"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.8/jolt-v0.7.8-x86_64-linux.tar.gz"
      sha256 "0cd21855c8dae81164a822742fe33c51e1b2fa32c8b1c923801b34cf4107108f"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
