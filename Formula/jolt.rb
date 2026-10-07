class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.19/jolt-v0.8.19-aarch64-macos.tar.gz"
      sha256 "a37e92c43ffa6320f22d8133b16102684bd8fd29b3bf5372316ee7608554f038"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.19/jolt-v0.8.19-x86_64-linux.tar.gz"
      sha256 "d2cdd9c0e05133171a7c70edbf1a523dcd93cf9fb3394acecc69ca2fbd2dcb02"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
