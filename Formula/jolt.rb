class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.0/jolt-v0.8.0-aarch64-macos.tar.gz"
      sha256 "854a607997dcbef7006fa27ececd88c84691a4c3e273e27e55ed264770e120cc"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.0/jolt-v0.8.0-x86_64-linux.tar.gz"
      sha256 "46382f3dbb4f3c836f614e4eeb876e48813a2e332a119eaeb31253979a28fcec"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
