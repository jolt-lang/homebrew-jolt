class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.28/jolt-v0.7.28-aarch64-macos.tar.gz"
      sha256 "bfa324c1d17ae4d7fcf8d3ffc1b60014d318c8131d7452a605b6b83f81568517"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.28/jolt-v0.7.28-x86_64-linux.tar.gz"
      sha256 "a6256db62d14462d9b9169eb28a7050bb6a060b973f30857673955b1a4019e6d"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
