class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.24/jolt-v0.7.24-aarch64-macos.tar.gz"
      sha256 "08531ee4eddcb4df61be0d6533095fc7464217fe80c148e455669266003a2dd8"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.24/jolt-v0.7.24-x86_64-linux.tar.gz"
      sha256 "5a4a79937bdba638b2e64f348a16ac8c4c338f3c7cdc7821aa8e38655ec166d9"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
